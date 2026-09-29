:- use_module(library(apply)).

:- use_module(library(filesex)).

:- use_module(library(lists)).

:- use_module(library(pcre)).

:- use_module(library(process)).

:- use_module(library(readutil)).



:- initialization(main, main).



main(Args) :-

    catch(run(Args, ExitCode), Error, auditor_exception(Error, ExitCode)),

    halt(ExitCode).



auditor_exception(Error, 40) :-

    print_message(error, Error),

    writeln('RESULTADO AUDITOR LEAN: ERROR_PROPIO_DEL_AUDITOR'),

    writeln('ERROR|AUDITOR_EXCEPTION|0|audita_lean|El auditor fallo antes de completar sus controles internos.').



run(Args, ExitCode) :-

    parse_args(Args, File, LeanMode),

    absolute_file_name(File, Absolute, [access(read), file_type(regular)]),

    read_file_to_string(Absolute, Text, []),

    split_string(Text, "\n", "\r", Lines),

    numbered_lines(Lines, 1, Numbered),

    lean_result(LeanMode, Absolute, LeanCode, LeanOutput),

    format('ARCHIVO: ~w~n', [Absolute]),

    emit_lean_output(LeanOutput),

    emit_generator_metadata(Text),

    classify(LeanCode, LeanOutput, Text, Numbered, RawStatus, Issues, RawSummary),

    qualify_skipped_lean(LeanMode, RawStatus, RawSummary, Status, Summary),

    format('RESULTADO AUDITOR LEAN: ~w~n', [Status]),

    forall(member(Issue, Issues), emit_issue(Issue)),

    forall(member(Key-Value, Summary), format('~w: ~w~n', [Key, Value])),

    status_exit_code(Status, ExitCode).



parse_args([File], File, false) :- !.

parse_args(['--skip-lean', File], File, true) :- !.

parse_args([File, '--skip-lean'], File, true) :- !.

parse_args(['--lean-failed', File], File, failed) :- !.

parse_args([File, '--lean-failed'], File, failed) :- !.

parse_args(_, _, _) :-

    throw(error(domain_error(arguments, 'audita_lean.pl [--skip-lean|--lean-failed] archivo.lean'), _)).



numbered_lines([], _, []).

numbered_lines([Line|Rest], Number, [Number-Line|Numbered]) :-

    Next is Number + 1,

    numbered_lines(Rest, Next, Numbered).



lean_result(true, _, 0, 'Compilacion Lean no ejecutada en esta auditoria estructural.') :- !.

lean_result(failed, _, 1,

            'Lean ya rechazo este archivo durante la compilacion realizada por el proceso llamador.') :- !.

lean_result(false, File, Code, Output) :-

    ensure_elan_home,

    (   lake_root(File, Root), executable_path(lake, Executable)

    ->  Arguments = [env, lean, File], WorkingDirectory = Root

    ;   executable_path(lean, Executable)

    ->  Arguments = [File], file_directory_name(File, WorkingDirectory)

    ;   Code = 127,

        Output = 'No se encontro Lake ni Lean en PATH o en ~/.elan/bin.',

        !

    ),

    (   var(Code)

    ->  process_create(Executable, Arguments,

            [cwd(WorkingDirectory), stdout(pipe(Stdout)), stderr(pipe(Stderr)), process(Pid)]),

        read_string(Stdout, _, OutText),

        close(Stdout),

        read_string(Stderr, _, ErrText),

        close(Stderr),

        process_wait(Pid, Exit),

        exit_value(Exit, Code),

        string_concat(OutText, ErrText, Output)

    ;   true

    ).



qualify_skipped_lean(true, RawStatus, RawSummary, Status, Summary) :- !,

    (   RawStatus == 'CERTIFICADO'

    ->  Status = 'CERTIFICADO_ESTRUCTURAL'

    ;   Status = RawStatus

    ),

    replace_summary_value(

        RawSummary,

        'COMPILACION_LEAN',

        'NO_EJECUTADA_EN_ESTA_AUDITORIA',

        Summary

    ).

qualify_skipped_lean(_, Status, Summary, Status, Summary).



replace_summary_value([], Key, Value, [Key-Value]).

replace_summary_value([Key-_|Rest], Key, Value, [Key-Value|Rest]) :- !.

replace_summary_value([Pair|Rest], Key, Value, [Pair|Updated]) :-

    replace_summary_value(Rest, Key, Value, Updated).



ensure_elan_home :- getenv('ELAN_HOME', _), !.

ensure_elan_home :-

    getenv('USERPROFILE', Home),

    directory_file_path(Home, '.elan', ElanHome),

    setenv('ELAN_HOME', ElanHome).



exit_value(exit(Code), Code) :- !.

exit_value(killed(_), 124).



executable_path(Name, Path) :-

    absolute_file_name(path(Name), Path, [access(execute), file_errors(fail)]), !.

executable_path(Name, Path) :-

    getenv('USERPROFILE', Home),

    executable_filename(Name, Filename),

    directory_file_path(Home, '.elan/bin', Bin),

    directory_file_path(Bin, Filename, Path),

    access_file(Path, execute).



executable_filename(Name, Filename) :-

    ( current_prolog_flag(windows, true) -> atom_concat(Name, '.exe', Filename) ; Filename = Name ).



lake_root(File, Root) :-

    file_directory_name(File, Directory),

    ancestor_with_file(Directory, 'lakefile.toml', Root), !.



ancestor_with_file(Directory, Name, Directory) :-

    directory_file_path(Directory, Name, Candidate), exists_file(Candidate), !.

ancestor_with_file(Directory, Name, Root) :-

    file_directory_name(Directory, Parent), Parent \== Directory,

    ancestor_with_file(Parent, Name, Root).



emit_lean_output('') :- !.

emit_lean_output(Output) :-

    writeln('--- SALIDA LEAN ---'), write(Output),

    ( sub_string(Output, _, 1, 0, "\n") -> true ; nl ),

    writeln('--- FIN SALIDA LEAN ---').



emit_generator_metadata(Text) :-

    metadata_value(Text, 'GENERADO_POR', Generator),

    metadata_value(Text, 'FECHA_HORA_GENERACION', GeneratedAt),

    metadata_value(Text, 'ARGUMENTO_GENERACION', Argument),

    format('% GENERADO_POR: ~w~n', [Generator]),

    format('% FECHA_HORA_GENERACION: ~w~n', [GeneratedAt]),

    format('% ARGUMENTO_GENERACION: ~w~n', [Argument]),

    format('% RESPONSABLE_DE_CORRECCION: ~w~n', [Generator]).



metadata_value(Text, Key, Value) :-

    format(string(Prefix), '-- ~w: ', [Key]),

    split_string(Text, "\n", "\r", Lines),

    (   member(Line, Lines), string_concat(Prefix, RawValue, Line)

    ->  atom_string(Value, RawValue)

    ;   Value = 'NO_DECLARADO'

    ).



classify(127, _, _, _, 'INCONCLUSO',

         [issue('ENTORNO_LEAN_NO_DISPONIBLE', 0, entorno,

                'No se pudo iniciar Lean; no existe juicio sobre la entrada.')],

         ['COMPILACION_LEAN'-'NO_EJECUTADA']) :- !.

classify(LeanCode, LeanOutput, Text, Numbered, Status, Issues, Summary) :-

    generated_file(Text, Generated),

    (   LeanCode =\= 0

    ->  compiler_failure_status(Generated, Status),

        compiler_issue(Text, LeanOutput, Generated, Issue), Issues = [Issue],

        Summary = ['COMPILACION_LEAN'-'FALLIDA']

    ;   audit_compilable(Text, Numbered, Generated, Status, Issues, Summary)

    ).



generated_file(Text, true) :-

    split_string(Text, "\n", "\r", Lines),

    member(Line, Lines),

    code_line(Line),

    re_match('^(def Node_|def Deductive(?:Link|Node)_|(?:theorem|lemma) derive_)', Line),

    !.

generated_file(_, false).



compiler_failure_status(true, 'ERROR_DE_LA_HERRAMIENTA') :- !.

compiler_failure_status(false, 'ERROR_DE_LA_ENTRADA').



compiler_issue(Text, Output, true,

               issue('TRADUCCION_MD_A_LEAN_DEFECTUOSA', Line, Generator, Message)) :- !,

    metadata_value(Text, 'GENERADO_POR', Generator),

    format(string(Message),

           'Lean rechazo el archivo producido por ~w. La evaluacion no descalifica el Markdown ni su deduccion: exige reparar esa herramienta para que traslade todas las entradas, cuantificadores, relaciones y pasos ya presentes, regenerar el Lean y repetir la auditoria.',

           [Generator]),

    compiler_line(Output, Line).

compiler_issue(_, Output, false,

               issue('LEAN_RECHAZO_ARCHIVO', Line, lean,

                     'Lean detecto un error concreto en una entrada no generada; se conserva su diagnostico literal.')) :-

    compiler_line(Output, Line).



compiler_line(Output, Line) :-

    split_string(Output, ":", " \t\r\n", Parts),

    (   append(_, [LineText, ColumnText|_], Parts),

        catch(number_string(Line0, LineText), _, fail),

        catch(number_string(_, ColumnText), _, fail)

    ->  Line = Line0

    ;   Line = 0

    ).



audit_compilable(Text, Numbered, true, Status, Issues, Summary) :- !,

    generated_inventory(Numbered, Nodes, Definitions, Assertions, Links, Derivations),

    generated_self_issues(Numbered, Nodes, Definitions, Assertions, Links, SelfIssues),

    formal_relation_count(Numbered, RelationCount),

    length(Nodes, NodeCount), length(Links, LinkCount), length(Derivations, DerivationCount),

    Summary = ['COMPILACION_LEAN'-'CORRECTA', 'NODOS_FORMALES'-NodeCount,

               'ENLACES_DEDUCTIVOS'-LinkCount, 'RELACIONES_FORMALIZADAS'-RelationCount,

               'DERIVACIONES_CERTIFICADAS'-DerivationCount],

    (   SelfIssues \= []

    ->  Status = 'ERROR_PROPIO_DEL_AUDITOR', Issues = SelfIssues

    ;   generated_proof_status(Text, Nodes, Assertions, Links, Derivations, Status, Issues)

    ).

audit_compilable(_, Numbered, false, Status, Issues, Summary) :-

    general_inventory(Numbered, Theorems, UnsafeDeclarations),

    length(Theorems, TheoremCount),

    Summary = ['COMPILACION_LEAN'-'CORRECTA', 'TEOREMAS_CERTIFICADOS'-TheoremCount],

    (   UnsafeDeclarations \= []

    ->  Status = 'INCOMPLETO', Issues = UnsafeDeclarations

    ;   TheoremCount > 0

    ->  Status = 'CERTIFICADO', Issues = []

    ;   Status = 'INCONCLUSO',

        Issues = [issue('OBJETIVO_NO_DECLARADO', 0, archivo,

                        'El archivo compila, pero no declara un teorema objetivo que permita juzgar cierre.')]

    ).



generated_inventory(Numbered0, Nodes, Definitions, Assertions, Links, Derivations) :-
    executable_numbered_lines(Numbered0, Numbered),
    findall(node(Node, Line),
            (member(Line-Text, Numbered), formal_node_line(Text, Node)), Nodes),
    findall(definition(Node, Line),
            (member(Line-Text, Numbered), node_definition_line(Text, Node)), Definitions),
    Assertions = [],
    findall(Link,
            (member(Line-Text, Numbered), deductive_link_line(Text, Line, Link)), Links),
    findall(derive(Node, Line),
            (member(Line-Text, Numbered), derivation_line(Text, Node)), Derivations).

% Remove Lean comments before auditing, preserving original line numbers.
% Lean block comments may be nested.
executable_numbered_lines(Numbered, Executable) :-
    strip_lean_comments(Numbered, 0, Cleaned),
    include(nonempty_code_line, Cleaned, Executable).

strip_lean_comments([], _, []).
strip_lean_comments([Line-Text|Rest], D0, [Line-Clean|CleanRest]) :-
    string_codes(Text, Codes),
    strip_lean_comment_codes(Codes, D0, D1, CleanCodes),
    string_codes(Clean, CleanCodes),
    strip_lean_comments(Rest, D1, CleanRest).

strip_lean_comment_codes([], D, D, []).
strip_lean_comment_codes([0'-,0'-|_], 0, 0, []) :- !.
strip_lean_comment_codes([0'/,0'-|R], 0, D, C) :- !,
    strip_lean_comment_codes(R, 1, D, C).
strip_lean_comment_codes([C|R], 0, D, [C|Cs]) :- !,
    strip_lean_comment_codes(R, 0, D, Cs).
strip_lean_comment_codes([0'/,0'-|R], D0, D, C) :-
    D0 > 0, !, D1 is D0 + 1, strip_lean_comment_codes(R, D1, D, C).
strip_lean_comment_codes([0'-,0'/|R], D0, D, C) :-
    D0 > 0, !, D1 is D0 - 1, strip_lean_comment_codes(R, D1, D, C).
strip_lean_comment_codes([_|R], D0, D, C) :-
    D0 > 0, !, strip_lean_comment_codes(R, D0, D, C).

nonempty_code_line(_-Text) :-
    normalize_space(string(N), Text),
    N \== "".

formal_node_line(Text, Node) :-
    node_definition_line(Text, Node), !.

node_definition_line(Text, Node) :-
    code_line(Text),
    re_matchsub('^\\s*def\\s+Node_(?<node>[A-Za-z0-9_]+)\\s+\\(ctx\\s*:\\s*FormalContext\\)\\s*:\\s*Prop\\s*:=',
                Text, M, []),
    atom_string(N0, M.node),
    \+ sub_atom(N0, _, _, _, '_source'),
    \+ sub_atom(N0, _, _, _, '_clause'),
    Node = N0.
node_definition_line(Text, Node) :-
    code_line(Text),
    re_matchsub('^\\s*(?:theorem|lemma)\\s+derive_(?<node>[A-Za-z0-9_]+)\\s*\\(',
                Text, M, []),
    atom_string(Node, M.node).

deductive_link_line(Text, Line,
                    link(Node, Formula, none, [], 'FORMALIZADA', Line)) :-
    code_line(Text),
    re_matchsub('^\\s*def\\s+Deductive(?:Link|Node)_(?<node>[A-Za-z0-9_]+)_(?<formula>[0-9]+)\\s*\\(',
                Text, M, []),
    atom_string(Node, M.node),
    number_string(Formula, M.formula), !.

previous_formula("-", none) :- !.
previous_formula(Value, Formula) :- number_string(Formula, Value).
dependency_atoms("-", []) :- !.
dependency_atoms(Value, Dependencies) :-
    split_string(Value, ",", " \t", Parts),
    maplist(atom_string, Dependencies, Parts).

derivation_line(Text, Node) :-
    code_line(Text),
    re_matchsub('^\\s*(?:theorem|lemma)\\s+derive_(?<node>[A-Za-z0-9_]+)\\s*\\(',
                Text, M, []),
    atom_string(Node, M.node).

code_line(Text) :-
    normalize_space(string(N), Text),
    N \== "",
    \+ re_match('^\\s*--', N),
    \+ re_match('^\\s*/-', N).

formal_relation_count(Numbered0, Count) :-
    executable_numbered_lines(Numbered0, Numbered),
    findall(1,
            (member(_-Text, Numbered),
             re_match('^\\s*def\\s+Deductive(?:Link|Node)_[A-Za-z0-9_]+', Text)),
            Relations),
    length(Relations, Count).


generated_self_issues(Numbered0, Nodes, Definitions, Assertions, Links, Issues) :-
    executable_numbered_lines(Numbered0, Numbered),
    findall(Issue,
            structural_issue(Nodes, Definitions, Assertions, Links, Numbered, Issue),
            Raw),
    sort(Raw, Issues).


% Las definiciones Node_<nodo>_source_<indice> y ..._term son traducciones
% formales de formulas fuente emitidas por formal_lean_backend.py.
legitimate_source_node(Node) :-
    atom_string(Node, S),
    re_match('^.+_source_[0-9]+(?:_term)?$', S).


structural_issue(Nodes, Definitions, _, _, Numbered,

                 issue('NODO_SIN_DEFINICION', Line, Node,

                       'PUBLICAR declaro el nodo, pero no emitio su definicion Lean.')) :-

    member(node(Node, Line), Nodes), \+ memberchk(definition(Node, _), Definitions),

    \+ undecidable_node_exists(Numbered, Node).

structural_issue(Nodes, _, Assertions, _, _,

                 issue('NODO_SIN_ESTADO', Line, Node,

                       'PUBLICAR emitio el nodo sin marcador auditable de construccion y prueba.')) :-

    member(node(Node, Line), Nodes), Assertions \= [],

    \+ memberchk(assertion(Node, _, _, _), Assertions).

structural_issue(Nodes, _, _, Links, _,

                 issue('DEPENDENCIA_NO_REPRESENTADA', Line, Node,

                       'Un enlace Lean depende de un nodo que PUBLICAR no represento.')) :-

    member(link(Node, _, _, Dependencies, _, Line), Links),

    member(Dependency, Dependencies), \+ memberchk(node(Dependency, _), Nodes).

structural_issue(_, _, _, Links, Numbered,

                 issue('FORMULA_DE_ENLACE_INEXISTENTE', Line, Node,

                       'El enlace deductivo apunta a una formula fuente que no existe en el Lean.')) :-

    member(link(Node, Formula, _, _, _, Line), Links),

    \+ source_definition_exists(Numbered, Node, Formula).

structural_issue(_, _, _, Links, Numbered,

                 issue('ANTECEDENTE_INEXISTENTE', Line, Node,

                       'El enlace deductivo apunta a un paso anterior que no existe en el Lean.')) :-

    member(link(Node, _, Previous, _, _, Line), Links), Previous \= none,

    \+ source_definition_exists(Numbered, Node, Previous).

structural_issue(_, _, _, _, Numbered,

                 issue('PREDICADO_OPACO_INTRODUCIDO', Line, Node,

                       'PUBLICAR sustituyo contenido matematico por Assertion_/Context_; debe corregirse el traductor.')) :-

    member(Line-Text, Numbered),

    code_line(Text),

    re_matchsub('^def Node_(?<node>[A-Za-z0-9_]+) .*ctx\\.(?:Assertion_|Context_)', Text, Match, []),

    atom_string(Node0, Match.node),
    \+ legitimate_source_node(Node0),
    Node = Node0.

structural_issue(_, _, _, _, Numbered,

                 issue('SUPUESTO_SINTETICO_INTRODUCIDO', Line, Node,

                       'PUBLICAR introdujo SourceAssumption/ProseClaim en vez de traducir la fuente.')) :-

    member(Line-Text, Numbered),

    code_line(Text),

    re_matchsub('^def Node_(?<node>[A-Za-z0-9_]+) .*ctx\\.(?:SourceAssumption_|ProseClaim_)', Text, Match, []),

    atom_string(Node, Match.node).



source_definition_exists(Numbered, Node, Formula) :-

    format(string(Pattern), '^def Node_~w_source_~d(?:_term)? ', [Node, Formula]),

    member(_-Text, Numbered), code_line(Text), re_match(Pattern, Text), !.



generated_proof_status(Text, Nodes, Assertions, Links, Derivations, Status, Issues) :-

    metadata_value(Text, 'GENERADO_POR', Generator),

    format(string(TranslationFailure),

           'El generador ~w reconocio en el Markdown esta entrada y su relacion deductiva, pero solo dejo metadatos y no creo la entrada formal correspondiente en codigo Lean. Es un fallo de traduccion MD-a-Lean, no de la deduccion: debe repararse el generador, regenerarse el Lean y repetirse la auditoria.',

           [Generator]),

    format(string(MissingRelation),

           'El nodo procedente del Markdown requiere una relacion deductiva, pero el generador ~w no creo esa entrada en codigo Lean. Esto denuncia una traduccion incompleta y no permite emitir ningun juicio contra el razonamiento fuente.',

           [Generator]),

    format(string(UnprovedRelation),

           'El generador ~w creo la relacion Lean, pero no existe una prueba aceptada por el nucleo. No se atribuye automaticamente a la fuente ni a la herramienta: debe compararse la derivacion con el Markdown antes de emitir juicio.',

           [Generator]),

    findall(issue('NODO_NO_DECIDIBLE', Line, Node,

                  'El nodo procede de prosa sin formula; el auditor no lo declara correcto ni incorrecto.'),

            ( member(assertion(Node, 'NO_DECIDIBLE', Proof, Line), Assertions),

              undecidable_affects_closure(Node, Proof, Links) ), Undecidable),

    findall(issue('ENTRADA_MD_NO_TRASLADADA_A_LEAN', Line, Node,

                  TranslationFailure),

            ( member(assertion(Node, _, Proof, Line), Assertions), proof_required(Proof),

              \+ memberchk(derive(Node, _), Derivations),

              node_has_deductive_link(Node, Links),

              \+ node_has_formal_relation(Text, Node) ), ToolFailures),

    findall(issue('RELACION_NO_CREADA_EN_LEAN', Line, Node,

                  MissingRelation),

            ( member(assertion(Node, _, Proof, Line), Assertions), proof_required(Proof),

              \+ memberchk(derive(Node, _), Derivations),

              \+ node_has_deductive_link(Node, Links),

              \+ node_has_formal_relation(Text, Node) ), MissingRelations),

    findall(issue('RELACION_SIN_PRUEBA_LEAN', Line, Node,

                  UnprovedRelation),

            ( member(assertion(Node, _, Proof, Line), Assertions), proof_required(Proof),

              \+ memberchk(derive(Node, _), Derivations),

              node_has_formal_relation(Text, Node) ), UnprovedRelations),

    (   Assertions == [], Derivations \= []

    ->  Status = 'CERTIFICADO', Issues = []

    ;   Undecidable \= []

    ->  Status = 'NO_DECIDIBLE', Issues = Undecidable

    ;   Derivations \= [], ToolFailures == [], MissingRelations == [],

        UnprovedRelations == []

    ->  Status = 'CERTIFICADO', Issues = []

    ;   ToolFailures \= []

    ->  Status = 'ERROR_DE_LA_HERRAMIENTA',

        append([ToolFailures, MissingRelations, UnprovedRelations], Issues)

    ;   MissingRelations \= []

    ->  Status = 'ERROR_DE_LA_HERRAMIENTA',

        append(MissingRelations, UnprovedRelations, Issues)

    ;   UnprovedRelations \= []

    ->  Status = 'NO_DECIDIBLE', Issues = UnprovedRelations

    ;   Nodes == []

    ->  Status = 'ERROR_PROPIO_DEL_AUDITOR',

        Issues = [issue('AUDITORIA_GENERADA_SIN_NODOS', 0, archivo,

                        'El archivo se marca como generado, pero no contiene nodos formales.')]

    ;   Status = 'NO_DECIDIBLE',

        Issues = [issue('CIERRE_NO_DECIDIBLE', 0, archivo,

                        'Lean compila, pero el cierre no esta certificado ni pertenece a un fragmento decidido por este auditor.')]

    ).



undecidable_affects_closure(_, Proof, _) :-

    proof_required(Proof), !.

undecidable_affects_closure(Node, _, Links) :-

    member(link(Node, _, _, _, _, _), Links), !.



node_has_deductive_link(Node, Links) :-

    memberchk(link(Node, _, _, _, _, _), Links).



node_has_formal_relation(Text, Node) :-

    format(string(Pattern),

           '(?m)^def Deductive(?:Link|Node)_~w(?:_[0-9]+)? \\(ctx : FormalContext\\) : Prop :=',

           [Node]),

    re_match(Pattern, Text), !.



undecidable_node_exists(Numbered, Node) :-

    member(_-Text, Numbered),

    format(string(Pattern), '^-- DEMUESTRA_UNDECIDABLE_NODE: ~w\\|', [Node]),

    re_match(Pattern, Text), !.



proof_required('NO_CERTIFICADA').

proof_required('NO_INICIADA').

proof_required('PENDIENTE').

proof_required('TEOREMA_EMITIDO').



general_inventory(Numbered, Theorems, Unsafe) :-

    findall(theorem(Name, Line),

            ( member(Line-Text, Numbered),

              re_matchsub('^(?:theorem|lemma) (?<name>[A-Za-z0-9_''.]+)', Text, Match, []),

              atom_string(Name, Match.name) ), Theorems),

    findall(issue(Code, Line, Name, Message),

            unsafe_general_declaration(Numbered, Code, Line, Name, Message), Unsafe).



unsafe_general_declaration(Numbered, 'AXIOMA_DECLARADO', Line, Name,

                           'El archivo declara un axioma; compilarlo no demuestra ese supuesto.') :-

    member(Line-Text, Numbered),

    re_matchsub('^\\s*axiom (?<name>[A-Za-z0-9_''.]+)', Text, Match, []),

    atom_string(Name, Match.name).

unsafe_general_declaration(Numbered, 'DECLARACION_OPACA', Line, Name,

                           'El archivo contiene una declaracion opaque cuyo cuerpo no puede auditarse.') :-

    member(Line-Text, Numbered),

    re_matchsub('^\\s*opaque (?<name>[A-Za-z0-9_''.]+)', Text, Match, []),

    atom_string(Name, Match.name).



emit_issue(issue(Code, Line, Declaration, Message)) :-

    format('ERROR|~w|~d|~w|~w~n', [Code, Line, Declaration, Message]).



status_exit_code('CERTIFICADO', 0).

status_exit_code('CERTIFICADO_ESTRUCTURAL', 0).

status_exit_code('INCOMPLETO', 10).

status_exit_code('NO_DECIDIBLE', 20).

status_exit_code('ERROR_DE_LA_ENTRADA', 30).

status_exit_code('ERROR_DE_LA_HERRAMIENTA', 40).

status_exit_code('ERROR_PROPIO_DEL_AUDITOR', 40).

status_exit_code('INCONCLUSO', 50).
