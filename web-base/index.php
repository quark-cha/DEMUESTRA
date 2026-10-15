<?php
// Plantilla unica: funciona como indice en /proyectos/ y como ficha al copiarse
// dentro de /proyectos/NOMBRE/. Se mantiene en DEMUESTRA/web-base/index.php.
$dir = __DIR__;
$directoryName = basename($dir);

const ADEC_BASE_URL = 'https://sites.google.com/view/numeriprimi-teoremiecongetture/adec-engine/v0-8-6';
const ADEC_ANCHOR = '#h.4q0y44bfwvi3';
const ADEC_HELP_ES = 'Descarga el archivo JSON. Después, abre ADEC y pulsa «Carica» para seleccionar el JSON guardado por el navegador en la carpeta Descargas. ADEC se abre en una pestaña nueva.';
const ADEC_HELP_EN = 'Download the JSON file. Then open ADEC and choose “Carica” to select the JSON file saved by your browser in the Downloads folder. ADEC opens in a new tab.';

function h($value) { return htmlspecialchars((string) $value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); }
function starts_with($value, $prefix) { return substr((string) $value, 0, strlen($prefix)) === $prefix; }
function public_file_url($file) {
    $https = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') || (($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '') === 'https');
    $scheme = $https ? 'https' : 'http';
    $host = $_SERVER['HTTP_HOST'] ?? '';
    $path = rtrim(str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME'] ?? '')), '/');
    $encoded = implode('/', array_map('rawurlencode', explode('/', str_replace('\\', '/', $file))));
    return $scheme . '://' . $host . ($path ? $path : '') . '/' . $encoded;
}
function adec_url_for_json($jsonFile, $version = null) {
    return ADEC_BASE_URL . '?authuser=0' . ADEC_ANCHOR;
}
function adec_json_url($jsonFile, $version = null) {
    $url = public_file_url($jsonFile);
    if ($version !== null) $url .= '?v=' . rawurlencode((string) $version);
    return $url;
}
function adec_link($jsonFile, $version = null, $primary = false) {
    $labelEs = $primary ? 'Descargar + ADEC' : 'ADEC';
    $labelEn = $primary ? 'Download + ADEC' : 'ADEC';
    return '<a class="adec"'
        . ' title="' . h(ADEC_HELP_ES) . '"'
        . ' aria-label="Descargar el JSON y abrir ADEC en una pestaña nueva"'
        . ' aria-describedby="adec-help"'
        . ' data-label-es="' . h($labelEs) . '"'
        . ' data-label-en="' . h($labelEn) . '"'
        . ' data-adec-json="' . h(adec_json_url($jsonFile, $version)) . '"'
        . ' href="' . h(adec_url_for_json($jsonFile, $version)) . '"'
        . ' target="_blank" rel="noopener noreferrer">' . h($labelEs) . '</a>';
}
function read_json($path) {
    if (!is_file($path)) return [];
    $data = json_decode((string) file_get_contents($path), true);
    return is_array($data) ? $data : [];
}
function file_if_exists($directory, $name) { return is_file($directory . DIRECTORY_SEPARATOR . $name) ? $name : null; }
function first_file($directory, $names) {
    foreach ($names as $name) if (is_file($directory . DIRECTORY_SEPARATOR . $name)) return $name;
    return null;
}
function local_material($directory, $relative) {
    if (!is_string($relative) || $relative === '' || preg_match('/[\\\\\x00-\x1f]/', $relative)) return null;
    foreach (explode('/', $relative) as $part) {
        if ($part === '' || $part === '.' || $part === '..' || $part[0] === '.') return null;
    }
    $root = realpath($directory);
    $candidate = realpath($directory . DIRECTORY_SEPARATOR . $relative);
    return $root && $candidate && is_file($candidate)
        && starts_with($candidate, $root . DIRECTORY_SEPARATOR) ? $candidate : null;
}
function material_url($prefix, $relative, $candidate) {
    return $prefix . implode('/', array_map('rawurlencode', explode('/', $relative)))
        . '?v=' . hash_file('sha256', $candidate);
}
function additional_attachments($directory, $prefix) {
    $catalog = read_json($directory . DIRECTORY_SEPARATOR . 'documentos_proyecto.json');
    $allowed = ['py', 'pl', 'cpp', 'hpp', 'q', 'qasm', 'bat', 'ps1', 'sh', 'txt', 'json', 'zip', 'pdf'];
    $result = [];
    foreach (is_array($catalog['adjuntos'] ?? null) ? $catalog['adjuntos'] : [] as $relative) {
        $candidate = local_material($directory, $relative);
        if (!$candidate || !in_array(strtolower(pathinfo($relative, PATHINFO_EXTENSION)), $allowed, true)) continue;
        if (isset($result[$relative])) continue;
        $view = text_viewer_url(rtrim($prefix, '/'), $relative);
        $result[$relative] = [
            'name' => basename($relative), 'path' => $relative,
            'view' => substr($relative, -4) === '.zip' ? null : (substr($relative, -4) === '.pdf'
                ? material_url($prefix, $relative, $candidate) : $view . '&v=' . hash_file('sha256', $candidate)),
            'download' => $view . '&download=1&v=' . hash_file('sha256', $candidate),
        ];
    }
    return array_values($result);
}
function additional_documents($directory, $prefix) {
    $catalog = read_json($directory . DIRECTORY_SEPARATOR . 'documentos_proyecto.json');
    $result = [];
    foreach (is_array($catalog['documentos'] ?? null) ? $catalog['documentos'] : [] as $entry) {
        if (!is_array($entry)) continue;
        $source = $entry['fuente'] ?? '';
        if (!is_string($source) || $source === ($catalog['principal'] ?? '') || substr($source, -3) !== '.md') continue;
        if (!local_material($directory, $source)) continue;
        $links = [];
        foreach (['md', 'pdf', 'html'] as $ext) {
            $relative = substr($source, 0, -3) . '.' . $ext;
            $candidate = local_material($directory, $relative);
            if ($candidate) {
                $links[$ext] = material_url($prefix, $relative, $candidate);
            }
        }
        $result[] = ['title' => $entry['titulo'] ?? $source, 'path' => $source, 'links' => $links];
    }
    return $result;
}
function text_viewer_url($prefix, $file) {
    $index = $prefix === '' ? 'index.php' : rtrim($prefix, '/') . '/index.php';
    return $index . '?view=' . rawurlencode($file);
}
function status_class($category) {
    $classes = [
        'certified' => 'status-certified',
        'passed' => 'status-certified',
        'refuted' => 'status-refuted',
        'tool_error' => 'status-tool-error',
        'missing_premise' => 'status-missing-premise',
        'conditional' => 'status-conditional',
        'partial' => 'status-conditional',
        'inconclusive' => 'status-inconclusive',
    ];
    return $classes[$category] ?? 'status-inconclusive';
}
function traffic_class($color) {
    return in_array($color, ['green', 'yellow', 'red'], true)
        ? 'traffic-' . $color
        : 'traffic-yellow';
}

// Nginx puede bloquear las extensiones .log y .lean aunque existan. Esta
// vista sirve texto y descargas del catalogo sin ejecutar sus programas.
if (isset($_GET['view'])) {
    $requested = (string) $_GET['view'];
    $extension = strtolower(pathinfo($requested, PATHINFO_EXTENSION));
    $validName = basename($requested) === $requested
        && preg_match('/\A[A-Za-z0-9_.-]+\z/', $requested)
        && in_array($extension, ['log', 'lean', 'pl'], true);
    $candidate = $validName ? local_material($dir, $requested) : null;
    $validPath = $candidate !== null && realpath(dirname($candidate)) === realpath($dir);
    foreach (additional_attachments($dir, '') as $attachment) {
        if ($requested === $attachment['path']) {
            $candidate = local_material($dir, $requested);
            $validPath = $candidate !== null;
            break;
        }
    }

    if (!$validPath) {
        http_response_code(404);
        header('Content-Type: text/plain; charset=UTF-8');
        echo "Archivo no disponible.\n";
        exit;
    }

    $download = ($_GET['download'] ?? '') === '1' || $extension === 'zip';
    header($download ? 'Content-Type: application/octet-stream' : ($extension === 'pdf'
        ? 'Content-Type: application/pdf' : 'Content-Type: text/plain; charset=UTF-8'));
    header('Content-Disposition: ' . ($download ? 'attachment' : 'inline')
        . '; filename="' . rawurlencode(basename($candidate)) . '"');
    header('X-Content-Type-Options: nosniff');
    readfile($candidate);
    exit;
}

function translation_problems($diagnostic) {
    if (!is_string($diagnostic) || trim($diagnostic) === '') return [];
    $groups = [];
    foreach (preg_split('/\r?\n/', $diagnostic) as $line) {
        if (strpos($line, '- ') !== 0) continue;
        if (strpos($line, 'probabilidad condicionada') !== false) {
            $description = 'El traductor no dispone del modelo tipado para representar estas probabilidades condicionadas.';
        } elseif (strpos($line, 'variable de sumatoria') !== false) {
            $description = 'El traductor no consigue interpretar el indice de estas sumatorias como un identificador.';
        } elseif (strpos($line, 'se esperaba') !== false && strpos($line, 'se obtuvo') !== false) {
            $description = 'El traductor no consigue resolver los tipos matematicos de esta expresion. Los tipos esperados y obtenidos aparecen en el diagnostico tecnico.';
        } else {
            $description = 'Otras expresiones pendientes de traduccion; consultar el diagnostico tecnico.';
        }
        if (!isset($groups[$description])) $groups[$description] = [];
        if (preg_match('/:([ADPT]_[A-Za-z0-9_]+):formula-[0-9]+:/', $line, $match)) {
            $groups[$description][] = $match[1];
        }
    }
    if (!$groups) $groups['Diagnostico disponible en el detalle tecnico.'] = [];
    $result = [];
    foreach ($groups as $description => $nodes) {
        $result[] = ['description' => $description, 'nodes' => array_values(array_unique($nodes))];
    }
    return $result;
}

function certification_summary($partial, $lean, $traffic, $reports) {
    $ids = function($values) {
        return is_array($values)
            ? array_values(array_unique(array_filter($values, fn($id) => is_string($id) && $id !== '')))
            : [];
    };
    $certified = $ids($partial['certified_nodes'] ?? []);
    $toolPending = $ids(array_merge(
        $ids($partial['failed_translation_nodes'] ?? []),
        $ids($lean['translation_error_json_nodes'] ?? [])
    ));
    $undetermined = $ids(array_merge(
        $ids($partial['undetermined_nodes'] ?? []),
        $ids($lean['undetermined_json_nodes'] ?? [])
    ));
    $toolPending = array_values(array_diff($toolPending, $certified));
    $undetermined = array_values(array_diff($undetermined, $certified, $toolPending));
    $total = count($ids(array_merge($certified, $toolPending, $undetermined)));
    $refutations = $traffic['current_metrics']['formal_refutations'] ?? null;
    $refutations = is_int($refutations) && $refutations >= 0 ? $refutations : null;
    // Sin un recuento, los informes solo permiten afirmar presencia o ausencia.
    $explicitRefutation = false;
    $explicitNoRefutation = false;
    foreach ($reports as $report) {
        if (($report['refuted'] ?? null) === true) $explicitRefutation = true;
        if (($report['refuted'] ?? null) === false) $explicitNoRefutation = true;
    }
    $refutationLabel = $explicitRefutation && !$refutations ? 'Detectadas; consultar informe'
        : ($refutations !== null ? (string) $refutations
            : ($explicitNoRefutation && !$explicitRefutation ? '0' : 'Sin evaluar'));
    return [
        'label' => $total > 0 ? 'Certificados ' . count($certified) . '/' . $total : 'Cobertura sin evaluar',
        'certified' => count($certified),
        'total' => $total,
        'tool_pending' => count($toolPending),
        'undetermined' => count($undetermined),
        'refutations' => $refutationLabel,
    ];
}

function project_info($directory, $base, $urlPrefix = '') {
    $jsonName = $base . '.json';
    if (!is_file($directory . DIRECTORY_SEPARATOR . $jsonName)) {
        $extracted = glob($directory . DIRECTORY_SEPARATOR . '*.extracted.json') ?: [];
        if (count($extracted) !== 1) return null;
        $base = substr(basename($extracted[0]), 0, -strlen('.extracted.json'));
        $jsonName = is_file($directory . DIRECTORY_SEPARATOR . $base . '.json')
            ? $base . '.json' : $base . '.extracted.json';
    }
    $data = read_json($directory . DIRECTORY_SEPARATOR . $jsonName);
    $leanEvalName = 'LEAN_' . $base . '.json';
    $leanEval = read_json($directory . DIRECTORY_SEPARATOR . $leanEvalName);
    $prologEvalName = first_file($directory, ['PROLOG_JSON_' . $base . '.json', 'PROLOG_' . $base . '.json'])
        ?? 'PROLOG_JSON_' . $base . '.json';
    $prologEval = read_json($directory . DIRECTORY_SEPARATOR . $prologEvalName);
    $prologFromJson = starts_with($prologEvalName, 'PROLOG_JSON_');
    $prologEvaluator = $prologFromJson ? 'Prolog desde el JSON inicial' : 'Prolog estructural';
    $prologReportBase = substr($prologEvalName, 0, -strlen('.json'));
    $prologDirectName = 'PROLOG_MD_DIRECTO_' . $base . '.json';
    $prologDirect = read_json($directory . DIRECTORY_SEPARATOR . $prologDirectName);
    $auditName = 'AUDITORIA_' . $base . '.json';
    $audit = read_json($directory . DIRECTORY_SEPARATOR . $auditName);
    $partialName = 'CERTIFICADO_PARCIAL_LEAN_' . $base . '.json';
    $partial = read_json($directory . DIRECTORY_SEPARATOR . $partialName);
    if (!$partial && is_array($leanEval['partial_kernel_certificate'] ?? null)) {
        $partial = $leanEval['partial_kernel_certificate'];
    }
    $trafficName = 'SEMAFORO_' . $base . '.json';
    $traffic = read_json($directory . DIRECTORY_SEPARATOR . $trafficName);
    $coverage = certification_summary($partial, $leanEval, $traffic, [$leanEval, $prologEval, $prologDirect, $audit]);
    $leanCoverage = $coverage;
    $directCoverage = is_array($prologDirect['coverage'] ?? null) ? $prologDirect['coverage'] : [];
    $directLabel = $prologDirect['verdict'] ?? 'SIN EVALUAR';
    if (($directCoverage['scope'] ?? '') === 'dependency_closure_under_declared_markdown_premises') {
        $certified = is_array($directCoverage['certified_nodes'] ?? null) ? count(array_unique($directCoverage['certified_nodes'])) : 0;
        $pending = is_array($directCoverage['pending_nodes'] ?? null) ? count(array_unique($directCoverage['pending_nodes'])) : 0;
        $directLabel = 'Certificados estructurales ' . $certified . '/' . ($certified + $pending);
        if ($coverage['total'] === 0 && $certified + $pending > 0) {
            $coverage['label'] = $directLabel;
            $coverage['certified'] = $certified;
            $coverage['total'] = $certified + $pending;
            $coverage['undetermined'] = $pending;
        }
    }
    $translation = read_json($directory . DIRECTORY_SEPARATOR . 'TRADUCCION_' . $base . '.json');
    $classifications = is_array($audit['classifications'] ?? null) ? $audit['classifications'] : [];
    $sourcePath = $directory . DIRECTORY_SEPARATOR . $base . '.md';
    if (($translation['status'] ?? '') === 'ERROR_HERRAMIENTA_TRADUCCION_LEAN'
            && is_file($sourcePath)
            && ($translation['source_sha256'] ?? '') === hash_file('sha256', $sourcePath)) {
        $classifications[] = [
            'evaluator' => 'Lean',
            'state' => 'Evaluacion pendiente por limitacion del traductor',
            'category' => 'tool_error',
            'color' => 'blue',
            'detail' => 'El traductor no ha completado esta via de evaluacion. No emite un juicio sobre la validez del documento ni altera los resultados de los otros evaluadores. El diagnostico tecnico esta disponible en el informe de traduccion.',
        ];
    }
    $independentResults = [
        ['evaluator' => $prologEvaluator, 'report' => $prologEval,
         'state' => $prologEval['verdict'] ?? 'SIN EVALUAR'],
        ['evaluator' => 'Prolog directo del MD', 'report' => $prologDirect,
         'state' => $directLabel . (($prologDirect['passed'] ?? false)
             ? ' — ' . ($prologDirect['verdict'] ?? '') : '')],
    ];
    foreach ($independentResults as $result) {
        if (!$result['report']) continue;
        // The independent report supplies its own current result and scope.
        $classifications = array_values(array_filter($classifications, function($classification) use ($result) {
            return ($classification['evaluator'] ?? '') !== $result['evaluator'];
        }));
        $report = $result['report'];
        $refuted = ($report['refuted'] ?? false) === true;
        $passed = ($report['passed'] ?? false) === true;
        $classifications[] = [
            'evaluator' => $result['evaluator'], 'state' => $result['state'],
            'category' => $refuted ? 'refuted' : ($passed ? 'passed' : 'inconclusive'),
            'detail' => (isset($report['goal']) ? 'Objetivo: ' . $report['goal'] . '. ' : '')
                . ($report['scope'] ?? $report['diagnosis'] ?? ''),
        ];
    }
    $prefix = $urlPrefix === '' ? '' : rtrim($urlPrefix, '/') . '/';
    $numericName = 'NUMERICO_' . $base . '.json';
    $temporalName = 'TEMPORAL_' . $base . '.json';
    $temporal = read_json($directory . DIRECTORY_SEPARATOR . $temporalName);
    $temporalCurrent = is_file($sourcePath)
        && ($temporal['source_sha256'] ?? '') === hash_file('sha256', $sourcePath);
    $numeric = read_json($directory . DIRECTORY_SEPARATOR . $numericName);
    $numericEvidenceName = 'NUMERICO_DATOS_' . $base . '.json';
    $numericEvidencePath = $directory . DIRECTORY_SEPARATOR . $numericEvidenceName;
    $numericCurrent = is_file($sourcePath) && is_file($numericEvidencePath)
        && ($numeric['source_sha256'] ?? '') === hash_file('sha256', $sourcePath)
        && ($numeric['evidence_sha256'] ?? '') === hash_file('sha256', $numericEvidencePath);
    return [
        'base' => $base,
        'coverage' => $coverage,
        'lean_coverage_label' => $leanCoverage['label'],
        'translation_json' => file_if_exists($directory, 'TRADUCCION_' . $base . '.json')
            ? $prefix . 'TRADUCCION_' . $base . '.json' : null,
        'additional_documents' => additional_documents($directory, $prefix),
        'additional_attachments' => additional_attachments($directory, $prefix),
        'url' => $urlPrefix === '' ? './' : $urlPrefix . '/',
        'title' => $data['title'] ?? $base,
        'subtitle' => $data['subtitle'] ?? null,
        'revision' => $data['revision'] ?? null,
        'image' => first_file($directory, [$base . '.jpg', $base . '.jpeg', $base . '.png', $base . '.webp']),
        'pdf' => file_if_exists($directory, $base . '.pdf') ? $prefix . $base . '.pdf?v=' . hash_file('sha256', $directory . DIRECTORY_SEPARATOR . $base . '.pdf') : null,
        'md' => file_if_exists($directory, $base . '.md') ? $prefix . $base . '.md?v=' . hash_file('sha256', $sourcePath) : null,
        'json' => $prefix . $jsonName,
        'json_version' => filemtime($directory . DIRECTORY_SEPARATOR . $jsonName) ?: null,
        'lean_source' => file_if_exists($directory, $base . '.lean') ? text_viewer_url($urlPrefix, $base . '.lean') : null,
        'lean_md' => file_if_exists($directory, 'LEAN_' . $base . '.md') ? $prefix . 'LEAN_' . $base . '.md' : null,
        'lean_json' => file_if_exists($directory, $leanEvalName) ? $prefix . $leanEvalName : null,
        'lean_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $leanEvalName) ? filemtime($directory . DIRECTORY_SEPARATOR . $leanEvalName) : null,
        'lean_log' => file_if_exists($directory, 'LEAN_' . $base . '.log') ? text_viewer_url($urlPrefix, 'LEAN_' . $base . '.log') : null,
        'lean_verdict' => $leanEval['verdict'] ?? null,
        'lean_passed' => array_key_exists('passed', $leanEval) ? (bool) $leanEval['passed'] : null,
        'prolog_source' => !$prologFromJson && file_if_exists($directory, $base . '.pl') ? text_viewer_url($urlPrefix, $base . '.pl') : null,
        'prolog_md' => file_if_exists($directory, $prologReportBase . '.md') ? $prefix . $prologReportBase . '.md' : null,
        'prolog_json' => file_if_exists($directory, $prologEvalName) ? $prefix . $prologEvalName : null,
        'prolog_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $prologEvalName) ? filemtime($directory . DIRECTORY_SEPARATOR . $prologEvalName) : null,
        'prolog_log' => file_if_exists($directory, $prologReportBase . '.log') ? text_viewer_url($urlPrefix, $prologReportBase . '.log') : null,
        'prolog_verdict' => $prologEval['verdict'] ?? null,
        'prolog_evaluator' => $prologEvaluator,
        'prolog_passed' => $prologEval['passed'] ?? null,
        'prolog_scope' => $prologEval['scope'] ?? '',
        'prolog_direct_scope' => $prologDirect['scope'] ?? '',
        'prolog_direct_md' => file_if_exists($directory, 'PROLOG_MD_DIRECTO_' . $base . '.md') ? $prefix . 'PROLOG_MD_DIRECTO_' . $base . '.md' : null,
        'prolog_direct_json' => file_if_exists($directory, $prologDirectName) ? $prefix . $prologDirectName : null,
        'prolog_direct_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $prologDirectName) ? filemtime($directory . DIRECTORY_SEPARATOR . $prologDirectName) : null,
        'prolog_direct_log' => file_if_exists($directory, 'PROLOG_MD_DIRECTO_' . $base . '.log') ? text_viewer_url($urlPrefix, 'PROLOG_MD_DIRECTO_' . $base . '.log') : null,
        'prolog_direct_verdict' => $directLabel,
        'prolog_direct_conditions' => is_array($prologDirect['goal_conditions_missing'] ?? null) ? $prologDirect['goal_conditions_missing'] : [],
        'translation_pending' => ($translation['category'] ?? '') === 'tool_error',
        'translation_detail' => is_string($translation['detail'] ?? null) ? $translation['detail'] : '',
        'translation_problems' => translation_problems($translation['detail'] ?? ''),
        'prolog_direct_refuted' => array_key_exists('refuted', $prologDirect) ? (bool) $prologDirect['refuted'] : null,
        'open_obligations' => is_array($prologDirect['open_obligations'] ?? null) ? $prologDirect['open_obligations'] : [],
        'audit_md' => file_if_exists($directory, 'AUDITORIA_' . $base . '.md') ? $prefix . 'AUDITORIA_' . $base . '.md' : null,
        'audit_json' => file_if_exists($directory, $auditName) ? $prefix . $auditName : null,
        'audit_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $auditName) ? filemtime($directory . DIRECTORY_SEPARATOR . $auditName) : null,
        'audit_log' => file_if_exists($directory, 'AUDITORIA_' . $base . '.log') ? text_viewer_url($urlPrefix, 'AUDITORIA_' . $base . '.log') : null,
        'audit_verdict' => $audit['verdict'] ?? null,
        'numeric_json' => file_if_exists($directory, $numericName) ? $prefix . $numericName : null,
        'numeric_md' => file_if_exists($directory, 'NUMERICO_' . $base . '.md') ? $prefix . 'NUMERICO_' . $base . '.md' : null,
        'numeric_evidence' => file_if_exists($directory, $numericEvidenceName) ? $prefix . $numericEvidenceName : null,
        'numeric_status' => $numericCurrent ? ($numeric['status'] ?? 'SIN EVALUAR') : 'EVIDENCIA HISTORICA O NO VERIFICADA',
        'numeric_scope' => $numeric['scope'] ?? '',
        'temporal_json' => file_if_exists($directory, $temporalName) ? $prefix . $temporalName : null,
        'temporal_md' => file_if_exists($directory, 'TEMPORAL_' . $base . '.md') ? $prefix . 'TEMPORAL_' . $base . '.md' : null,
        'temporal_status' => $temporalCurrent ? ($temporal['status'] ?? 'SIN EVALUAR') : 'EVIDENCIA HISTORICA O NO VERIFICADA',
        'temporal_scope' => $temporal['scope'] ?? '',
        'classifications' => $classifications,
        'recommendation' => is_array($audit['recommendation'] ?? null) ? $audit['recommendation'] : [],
        'partial_json' => file_if_exists($directory, $partialName) ? $prefix . $partialName : null,
        'partial_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $partialName) ? filemtime($directory . DIRECTORY_SEPARATOR . $partialName) : null,
        'partial_status' => $partial['status'] ?? null,
        'partial_certified_count' => count($partial['certified_nodes'] ?? []),
        'traffic_json' => file_if_exists($directory, $trafficName) ? $prefix . $trafficName : null,
        'traffic_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $trafficName) ? filemtime($directory . DIRECTORY_SEPARATOR . $trafficName) : null,
        'traffic_color' => $traffic['color'] ?? 'yellow',
        'traffic_state' => $traffic['state'] ?? 'SIN_REFERENCIA_ANTERIOR',
        'traffic_improvements' => is_array($traffic['improvements'] ?? null) ? $traffic['improvements'] : [],
        'traffic_regressions' => is_array($traffic['regressions'] ?? null) ? $traffic['regressions'] : [],
        'rollback_available' => ($traffic['rollback_available'] ?? false) === true,
        'publication_status' => str_replace('_', ' ', $data['publication_status'] ?? (($leanEval['passed'] ?? false) ? 'CERTIFICADO' : 'NO CERTIFICADO')),
    ];
}

$currentProject = project_info($dir, $directoryName);
$isProjectPage = $currentProject !== null;
$projects = [];
if ($isProjectPage) {
    $projects[] = $currentProject;
} else {
    foreach (glob($dir . DIRECTORY_SEPARATOR . '*', GLOB_ONLYDIR) ?: [] as $projectDir) {
        $base = basename($projectDir);
        $project = project_info($projectDir, $base, rawurlencode($base));
        if ($project !== null) $projects[] = $project;
    }
    usort($projects, fn($a, $b) => strcasecmp($a['base'], $b['base']));
}
?>
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title><?= $isProjectPage ? h($currentProject['base']) . ' - DEMUESTRA' : 'DEMUESTRA - Proyectos' ?></title>
<style>
:root{color-scheme:light;--bg:#f4f6f5;--panel:#fff;--text:#172126;--muted:#647178;--line:#d5deda;--accent:#126783;--green:#1f6a43;--red:#a53535;--blue:#176b91;--yellow:#8a6514;--orange:#a45116;--gray:#59656b}*{box-sizing:border-box}body{margin:0;font-family:system-ui,-apple-system,"Segoe UI",sans-serif;background:var(--bg);color:var(--text)}header{background:#fff;border-bottom:1px solid var(--line)}.wrap{width:min(1120px,calc(100% - 32px));margin:auto}.top{padding:26px 0 22px;display:flex;justify-content:space-between;align-items:end;gap:20px}h1{margin:0;font-size:clamp(28px,5vw,48px);line-height:1;letter-spacing:0}.muted{color:var(--muted)}main{padding:26px 0 48px}.back{display:inline-block;margin-bottom:18px;color:var(--accent);font-weight:700;text-decoration:none}.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(290px,1fr));gap:18px}.project-page .grid{grid-template-columns:1fr}article{display:grid;grid-template-rows:auto 1fr auto auto;border:1px solid var(--line);border-radius:8px;background:var(--panel);overflow:hidden}.project-page article{grid-template-columns:minmax(260px,.8fr) minmax(320px,1.2fr);grid-template-rows:auto auto auto}.image{aspect-ratio:16/9;background:#e8edeb;border-bottom:1px solid var(--line)}.project-page .image{grid-row:1/span 3;aspect-ratio:auto;border:0;border-right:1px solid var(--line)}.image img{width:100%;height:100%;object-fit:cover;display:block}.body{padding:18px}.meta{display:flex;align-items:center;flex-wrap:wrap;gap:8px;margin-bottom:12px;color:var(--muted);font-size:13px}.badge{border:1px solid var(--line);border-radius:999px;padding:3px 9px;font-weight:700}.approved{color:var(--green);border-color:#9bc9ae;background:#eef8f2}.rejected{color:var(--red);border-color:#dfb0b0;background:#fff4f4}.pending{color:var(--yellow)}h2{margin:0 0 9px;font-size:22px;line-height:1.2;letter-spacing:0}h3{margin:0 0 10px;font-size:15px;letter-spacing:0}p{margin:0;color:var(--muted);line-height:1.5}.assessment{padding:0 18px 18px}.traffic{display:grid;grid-template-columns:22px 1fr;gap:11px;align-items:start;margin-bottom:14px;padding:11px 13px;background:#f4f6f6;border:1px solid var(--line);border-radius:6px}.traffic-light{width:18px;height:18px;border-radius:50%;margin-top:2px;background:var(--yellow);box-shadow:0 0 0 4px #f5e8b5}.traffic-green .traffic-light{background:var(--green);box-shadow:0 0 0 4px #cfe8d8}.traffic-red .traffic-light{background:var(--red);box-shadow:0 0 0 4px #f2caca}.traffic strong{display:block;font-size:14px}.traffic p{font-size:13px;color:var(--text)}.status-list{display:grid;gap:7px}.status-row{display:grid;grid-template-columns:minmax(145px,.35fr) minmax(0,1fr);gap:12px;padding:9px 11px;border-left:5px solid var(--gray);background:#f4f6f6}.status-row strong{font-size:13px}.status-row span{font-size:13px;color:#3f4c52;overflow-wrap:anywhere}.status-certified{border-left-color:var(--green);background:#eef8f2}.status-refuted{border-left-color:var(--red);background:#fff2f2}.status-tool-error{border-left-color:var(--blue);background:#edf7fb}.status-missing-premise{border-left-color:var(--yellow);background:#fff8df}.status-conditional{border-left-color:var(--orange);background:#fff2e8}.status-inconclusive{border-left-color:var(--gray);background:#f2f4f4}.recommendation{margin-top:12px;padding:12px 14px;border-left:5px solid var(--accent);background:#eef6f8}.recommendation strong{display:block;margin-bottom:4px}.recommendation p{color:var(--text)}.actions{display:flex;flex-wrap:wrap;gap:8px;padding:0 18px 18px}.actions a{display:inline-flex;align-items:center;justify-content:center;min-height:37px;padding:8px 12px;border:1px solid var(--accent);border-radius:6px;color:var(--accent);background:#fff;text-decoration:none;font-size:14px;font-weight:700}.actions a.primary{background:var(--accent);color:#fff}.actions a.evidence{border-color:var(--green);color:var(--green)}.actions a.evidence.primary{background:var(--green);color:#fff}.actions a.adec{border-color:#514b88;color:#514b88}.actions a.disabled{pointer-events:none;border-color:#aaa;color:#777;background:#eee}.enter{margin-left:auto}.empty{padding:28px;border:1px dashed var(--line);background:#fff;border-radius:8px;color:var(--muted)}.prolog-help{margin-top:18px;border-top:1px solid var(--line);border-bottom:1px solid var(--line);background:#fff}.prolog-help summary{cursor:pointer;padding:15px 0;font-weight:750;color:var(--accent)}.prolog-help .help-body{padding:0 0 18px;display:grid;gap:10px}.prolog-help p{color:var(--text)}.prolog-help code{display:block;overflow-wrap:anywhere;padding:9px 11px;background:#eef2f0;border-left:3px solid var(--green);font-family:ui-monospace,"Cascadia Code",monospace;font-size:13px}.prolog-help a{color:var(--accent);font-weight:700}@media(max-width:720px){.top{display:block}.top .muted{display:block;margin-top:9px}.project-page article{grid-template-columns:1fr;grid-template-rows:auto auto auto auto}.project-page .image{grid-row:auto;aspect-ratio:16/9;border-right:0;border-bottom:1px solid var(--line)}.status-row{grid-template-columns:1fr;gap:3px}.enter{margin-left:0}}
.project-page article{grid-template-rows:auto auto auto auto}.project-page .image{grid-row:1/span 4}.badge.status-certified{color:#0f5b35;border-color:#68ad87;background:#e3f5e9}.badge.status-refuted{color:#8c2929;border-color:#d99b9b;background:#fff0f0}.badge.status-tool-error{color:#125d7e;border-color:#83bad0;background:#e8f5fa}.badge.status-missing-premise{color:#74530e;border-color:#d8bd68;background:#fff7d6}.badge.status-conditional{color:#8a4512;border-color:#d7a078;background:#fff0e4}.badge.status-inconclusive{color:#4d5a60;border-color:#aeb8bc;background:#f0f3f4}.primary-actions{padding-top:14px;border-top:1px solid var(--line)}.actions a.semaphore{border-color:var(--yellow);color:var(--yellow)}.actions a.semaphore.traffic-green{border-color:var(--green);color:var(--green)}.actions a.semaphore.traffic-red{border-color:var(--red);color:var(--red)}.analysis-actions{grid-column:2;padding:0 18px 18px}.analysis-row{display:grid;grid-template-columns:minmax(150px,.3fr) minmax(0,1fr);gap:14px;margin-top:7px;padding:12px 10px;border-top:1px solid var(--line);border-left:4px solid var(--gray);background:#f7f8f8}.analysis-row.status-certified{border-left-color:var(--green);background:#eaf7ef}.analysis-row.status-refuted{border-left-color:var(--red);background:#fff0f0}.analysis-row.status-tool-error{border-left-color:var(--blue);background:#edf7fb}.analysis-row.status-missing-premise{border-left-color:var(--yellow);background:#fff8df}.analysis-row.status-conditional{border-left-color:var(--orange);background:#fff2e8}.analysis-row.status-inconclusive{border-left-color:var(--gray);background:#f2f4f4}.analysis-label{display:grid;align-content:start;gap:3px}.analysis-label strong{font-size:14px}.analysis-label span{color:var(--muted);font-size:12px;line-height:1.35;overflow-wrap:anywhere}.analysis-row.status-certified .analysis-label strong,.analysis-row.status-certified .analysis-label span{color:#145c38}.analysis-row.status-conditional .analysis-label strong,.analysis-row.status-conditional .analysis-label span{color:#8a4512}.analysis-links{display:flex;flex-wrap:wrap;align-items:flex-start;gap:7px}.analysis-links a{display:inline-flex;align-items:center;justify-content:center;min-height:34px;padding:7px 10px;border:1px solid var(--accent);border-radius:6px;color:var(--accent);background:#fff;text-decoration:none;font-size:13px;font-weight:700}.analysis-links a.primary{background:var(--accent);color:#fff}.analysis-row.status-certified .analysis-links a.primary{border-color:var(--green);background:var(--green);color:#fff}.analysis-links a.evidence{border-color:var(--green);color:var(--green)}.analysis-row.status-conditional .analysis-links a.evidence{border-color:var(--orange);color:var(--orange)}.analysis-links a.adec{border-color:#514b88;color:#514b88}.analysis-links a.disabled{pointer-events:none;border-color:#aaa;color:#777;background:#eee}@media(max-width:720px){.project-page article{grid-template-rows:auto auto auto auto auto}.project-page .image{grid-row:auto}.analysis-actions{grid-column:1}.analysis-row{grid-template-columns:1fr;gap:8px}}
.sr-only{position:absolute!important;width:1px!important;height:1px!important;padding:0!important;margin:-1px!important;overflow:hidden!important;clip:rect(0,0,0,0)!important;white-space:nowrap!important;border:0!important}.skip-link{position:fixed;z-index:100;top:8px;left:8px;padding:10px 14px;background:#fff;color:var(--accent);border:2px solid var(--accent);border-radius:6px;font-weight:700;transform:translateY(-150%)}.skip-link:focus{transform:translateY(0)}a:focus-visible,summary:focus-visible{outline:3px solid #111;outline-offset:3px}.recommendation[aria-busy="true"]{border-left-color:var(--yellow)}
.actions{justify-content:flex-start;align-items:flex-start}.group-heading{flex:0 0 100%;margin:0 0 3px;font-size:14px;line-height:1.3}.project-page .primary-actions{grid-column:2}.analysis-links{justify-content:flex-start}.analysis-links a{flex:0 0 auto}@media(max-width:720px){.project-page .primary-actions{grid-column:1}}
.material-row{grid-template-columns:minmax(0,1fr) auto;border-left:0;background:transparent}.material-name{color:var(--accent);font-size:13px;font-weight:600;overflow-wrap:anywhere;text-decoration:none}.material-name:hover{text-decoration:underline}.materials-summary{padding:0 18px 18px;font-size:13px}.analysis-label{min-width:0}@media(max-width:720px){.material-row{grid-template-columns:minmax(0,1fr)}}
.project-page article.without-image{display:block}
</style></head>
<body class="<?= $isProjectPage ? 'project-page' : 'projects-page' ?>">
<a class="skip-link" href="#main-content">Saltar al contenido principal</a>
<header><div class="wrap top"><h1>DEMUESTRA</h1><span class="muted"><?= $isProjectPage ? h($currentProject['base']) : count($projects) . ' proyecto' . (count($projects) === 1 ? '' : 's') ?></span></div></header>
<main id="main-content" class="wrap" tabindex="-1">
<?php if ($isProjectPage): ?><a class="back" href="../">← Todos los proyectos</a><?php endif; ?>
<?php if (!$projects): ?><div class="empty">No hay proyectos publicados todavía.</div><?php else: ?>
<section class="grid" aria-label="Proyectos DEMUESTRA">
<?php foreach ($projects as $project): ?>
<?php
$classificationByEvaluator = [];
foreach ($project['classifications'] as $classification) {
    if (is_array($classification) && isset($classification['evaluator'])) {
        $classificationByEvaluator[$classification['evaluator']] = $classification;
    }
}
$leanCategory = $classificationByEvaluator['Lean']['category'] ?? ($project['lean_passed'] === true ? 'certified' : 'tool_error');
$prologCategory = $classificationByEvaluator[$project['prolog_evaluator']]['category'] ?? 'inconclusive';
$directCategory = $classificationByEvaluator['Prolog directo del MD']['category'] ?? 'inconclusive';
?>
<article class="<?= $project['image'] ? 'with-image' : 'without-image' ?>">
<?php if ($project['image']): ?><div class="image"><img src="<?= h(($isProjectPage ? '' : rawurlencode($project['base']) . '/') . $project['image']) ?>" alt="<?= h($project['title']) ?>"></div><?php endif; ?>
<div class="body"><div class="meta"><strong><?= h($project['base']) ?></strong><?php if ($project['revision']): ?><span>rev. <?= h($project['revision']) ?></span><?php endif; ?><span class="badge <?= $project['coverage']['certified'] > 0 ? 'status-certified' : 'status-inconclusive' ?>"><?= h($project['coverage']['label']) ?></span><span class="badge status-inconclusive">Refutaciones: <?= h($project['coverage']['refutations']) ?></span></div><h2><?= h($project['title']) ?></h2><?php if ($project['subtitle']): ?><p><?= h($project['subtitle']) ?></p><?php endif; ?><p>Última evaluación: resultados de las vías independientes. Los recuentos corresponden al alcance indicado en cada informe.</p><?php if ($project['coverage']['tool_pending']): ?><p><?= h($project['coverage']['tool_pending']) ?> pendientes por limitaciones documentadas de traducción o evaluación de la herramienta; no son refutaciones del MD.</p><?php endif; ?><?php if ($project['coverage']['undetermined']): ?><p><?= h($project['coverage']['undetermined']) ?> pendientes de evaluación concluyente. Un resultado no determinado no declara que el documento esté mal.</p><?php endif; ?></div>
<?php if ($isProjectPage && $project['classifications']): ?>
<section class="assessment" aria-label="Clasificación de la evaluación">
<div class="traffic <?= h(traffic_class($project['traffic_color'])) ?>"><span class="traffic-light" aria-hidden="true"></span><div><strong>Comparación: <?= h(str_replace('_', ' ', $project['traffic_state'])) ?></strong><?php foreach ($project['traffic_regressions'] as $reason): ?><p><?= h($reason) ?></p><?php endforeach; ?><?php foreach ($project['traffic_improvements'] as $reason): ?><p><?= h($reason) ?></p><?php endforeach; ?><?php if (!$project['traffic_regressions'] && !$project['traffic_improvements']): ?><p>No hay un cambio probatorio relevante respecto de la evaluación anterior.</p><?php endif; ?><?php if ($project['rollback_available']): ?><p><strong>Marcha atrás habilitada:</strong> la evaluación anterior permanece íntegra en <code>anterior</code>.</p><?php endif; ?></div></div>
<h3>Qué certifica y qué queda abierto</h3>
<?php if ($project['translation_pending'] && $project['translation_detail'] !== ''): ?>
<div class="recommendation"><strong>Qué falta en el traductor a Lean</strong>
<?php foreach ($project['translation_problems'] as $problem): ?><p><?= h($problem['description']) ?><?php if ($problem['nodes']): ?> Nodos: <?= h(implode(', ', $problem['nodes'])) ?>.<?php endif; ?></p><?php endforeach; ?>
<details><summary>Diagnóstico técnico completo</summary><pre style="white-space:pre-wrap;overflow-wrap:anywhere;font-size:12px"><?= h($project['translation_detail']) ?></pre></details>
</div>
<?php endif; ?>
<div class="status-list">
<?php foreach ($project['classifications'] as $classification): if (!is_array($classification)) continue; ?>
<div class="status-row <?= h(status_class($classification['category'] ?? 'inconclusive')) ?>"><strong><?= h(($classification['evaluator'] ?? 'Evaluador') . ': ' . ($classification['state'] ?? 'SIN DETERMINAR')) ?></strong><span><?= h($classification['detail'] ?? '') ?></span></div>
<?php endforeach; ?>
</div>
<?php if ($project['recommendation']): ?>
<div class="recommendation"><strong>Mejor siguiente paso</strong><p><?= h($project['recommendation']['primary_action'] ?? '') ?></p><?php if (!empty($project['recommendation']['expected_impact'])): ?><p><?= h($project['recommendation']['expected_impact']) ?></p><?php endif; ?></div>
<?php endif; ?>
</section>
<?php endif; ?>
<div class="actions primary-actions" aria-label="Documentos principales">
<h3 class="group-heading">Documentos generales</h3>
<?php if ($project['pdf']): ?><a class="primary" href="<?= h($project['pdf']) ?>">PDF</a><?php endif; ?>
<?php if ($project['md']): ?><a href="<?= h($project['md']) ?>">MD</a><?php endif; ?>
<?php if ($project['json']): ?><a href="<?= h($project['json']) ?>">JSON del MD</a><?= adec_link($project['json'], $project['json_version'], true) ?><?php endif; ?>
<?php if ($project['traffic_json']): ?><a class="semaphore traffic-<?= h($project['traffic_color']) ?>" href="<?= h($project['traffic_json']) ?>">Evaluación general</a><?php endif; ?>
<?php if (!$isProjectPage): ?><a class="enter" href="<?= h($project['url']) ?>">Entrar al proyecto →</a><?php endif; ?>
</div>
<?php if (!$isProjectPage && ($project['additional_documents'] || $project['additional_attachments'])): ?>
<p class="materials-summary"><?= count($project['additional_documents']) ?> documentos adicionales · <?= count($project['additional_attachments']) ?> archivos</p>
<?php endif; ?>
<?php if ($isProjectPage): ?>
<?php if ($project['additional_documents']): ?>
<section class="analysis-actions" aria-label="Documentos adicionales del proyecto">
<h3 class="group-heading">Documentos adicionales</h3>
<?php foreach ($project['additional_documents'] as $document): ?>
<div class="analysis-row material-row"><div class="analysis-label"><strong><?= h($document['title']) ?></strong><a class="material-name" href="<?= h($document['links']['md']) ?>"><?= h(basename($document['path'])) ?></a></div><div class="analysis-links">
<?php foreach ($document['links'] as $format => $link): ?><a href="<?= h($link) ?>" aria-label="<?= h(strtoupper($format) . ': ' . basename($document['path'])) ?>"><?= h(strtoupper($format)) ?></a><?php endforeach; ?>
</div></div>
<?php endforeach; ?>
</section>
<?php endif; ?>
<?php if ($project['additional_attachments']): ?>
<section class="analysis-actions" aria-label="Programas y archivos adicionales del proyecto">
<h3 class="group-heading">Programas y archivos adicionales</h3>
<?php foreach ($project['additional_attachments'] as $attachment): ?>
<div class="analysis-row material-row"><div class="analysis-label"><a class="material-name" href="<?= h($attachment['view'] ?? $attachment['download']) ?>"><?= h($attachment['name']) ?></a><span><?= h(dirname($attachment['path']) === '.' ? '' : dirname($attachment['path'])) ?></span></div><div class="analysis-links">
<?php if ($attachment['view']): ?><a href="<?= h($attachment['view']) ?>" aria-label="<?= h('Ver ' . $attachment['path']) ?>">Ver</a><?php endif; ?>
<a href="<?= h($attachment['download']) ?>" download="<?= h($attachment['name']) ?>" aria-label="<?= h('Descargar ' . $attachment['path']) ?>">Descargar</a>
</div></div>
<?php endforeach; ?>
</section>
<?php endif; ?>
<section class="analysis-actions" aria-label="Análisis independientes">
<div class="analysis-row <?= h(status_class($leanCategory)) ?>"><div class="analysis-label"><strong>1. Lean</strong><span><?= h($project['lean_coverage_label']) ?></span><?php if ($project['translation_pending']): ?><span>Pendiente por limitaciones de traducción de la herramienta; no refuta el documento.</span><?php endif; ?><span>Alcance y condiciones en el informe del evaluador.</span></div><div class="analysis-links"><?php if ($project['lean_md']): ?><a class="primary" href="<?= h($project['lean_md']) ?>">Informe</a><?php elseif ($project['translation_pending'] && $project['translation_json']): ?><a class="primary" href="<?= h($project['translation_json']) ?>">Diagnóstico de traducción</a><?php else: ?><a class="disabled">Sin evaluar</a><?php endif; ?><?php if ($project['lean_json']): ?><a href="<?= h($project['lean_json']) ?>">JSON</a><?= adec_link($project['lean_json'], $project['lean_json_version']) ?><?php endif; ?><?php if ($project['lean_log']): ?><a href="<?= h($project['lean_log']) ?>">Salida</a><?php endif; ?><?php if ($project['lean_source']): ?><a href="<?= h($project['lean_source']) ?>">Lean (.lean)</a><?php endif; ?><?php if ($project['partial_json']): ?><a class="evidence" href="<?= h($project['partial_json']) ?>">Certificado parcial (<?= h($project['partial_certified_count']) ?>)</a><?= adec_link($project['partial_json'], $project['partial_json_version']) ?><?php endif; ?></div></div>
<div class="analysis-row <?= h(status_class($prologCategory)) ?>"><div class="analysis-label"><strong><?= h('2. ' . $project['prolog_evaluator']) ?></strong><span><?= h($project['prolog_verdict'] ?? 'SIN EVALUAR') ?></span><span><?= h($project['prolog_scope']) ?></span></div><div class="analysis-links"><?php if ($project['prolog_md']): ?><a class="primary" href="<?= h($project['prolog_md']) ?>">Informe</a><?php endif; ?><?php if ($project['prolog_json']): ?><a href="<?= h($project['prolog_json']) ?>">JSON</a><?= adec_link($project['prolog_json'], $project['prolog_json_version']) ?><?php endif; ?><?php if ($project['prolog_log']): ?><a href="<?= h($project['prolog_log']) ?>">Salida</a><?php endif; ?><?php if ($project['prolog_source']): ?><a href="<?= h($project['prolog_source']) ?>">Prolog generado (.pl)</a><?php endif; ?></div></div>
<div class="analysis-row <?= h(status_class($directCategory)) ?>"><div class="analysis-label"><strong>3. Prolog directo del MD</strong><span><?= h($project['prolog_direct_verdict'] ?? 'SIN EVALUAR') ?></span></div><div class="analysis-links"><?php if ($project['prolog_direct_md']): ?><a class="primary" href="<?= h($project['prolog_direct_md']) ?>">Informe</a><?php endif; ?><?php if ($project['prolog_direct_json']): ?><a href="<?= h($project['prolog_direct_json']) ?>">JSON</a><?= adec_link($project['prolog_direct_json'], $project['prolog_direct_json_version']) ?><?php endif; ?><?php if ($project['prolog_direct_log']): ?><a href="<?= h($project['prolog_direct_log']) ?>">Salida</a><?php endif; ?></div></div>
<div class="analysis-row status-inconclusive"><div class="analysis-label"><strong>4. Auditoría final</strong><span><?= h($project['audit_verdict'] ?? 'SIN EVALUAR') ?></span></div><div class="analysis-links"><?php if ($project['audit_md']): ?><a class="primary" href="<?= h($project['audit_md']) ?>">Informe</a><?php endif; ?><?php if ($project['audit_json']): ?><a href="<?= h($project['audit_json']) ?>">JSON</a><?= adec_link($project['audit_json'], $project['audit_json_version']) ?><?php endif; ?><?php if ($project['audit_log']): ?><a href="<?= h($project['audit_log']) ?>">Salida</a><?php endif; ?></div></div>
<?php foreach ($project['prolog_direct_conditions'] as $condition): ?><p>Condición pendiente del evaluador Prolog: <?= h($condition) ?>. No es una refutación.</p><?php endforeach; ?>
<?php if ($project['numeric_json']): ?>
<div class="analysis-row status-inconclusive"><div class="analysis-label"><strong>5. Evaluación numérica</strong><span><?= h($project['numeric_status']) ?></span><span><?= h($project['numeric_scope']) ?></span></div><div class="analysis-links"><?php if ($project['numeric_md']): ?><a class="primary" href="<?= h($project['numeric_md']) ?>">Informe</a><?php endif; ?><a href="<?= h($project['numeric_json']) ?>">JSON</a><?php if ($project['numeric_evidence']): ?><a href="<?= h($project['numeric_evidence']) ?>">Datos del ensayo</a><?php endif; ?></div></div>
<?php endif; ?>
<?php if ($project['temporal_json']): ?>
<div class="analysis-row status-inconclusive"><div class="analysis-label"><strong>6. Control temporal de V</strong><span><?= h($project['temporal_status']) ?></span><span><?= h($project['temporal_scope']) ?></span><span>No verifica la dinámica física ni certifica equivalencia con Q.</span></div><div class="analysis-links"><?php if ($project['temporal_md']): ?><a class="primary" href="<?= h($project['temporal_md']) ?>">Informe</a><?php endif; ?><a href="<?= h($project['temporal_json']) ?>">JSON</a></div></div>
<?php endif; ?>
</section>
<?php endif; ?>
</article>
<?php endforeach; ?>
</section>
<?php if ($isProjectPage && $currentProject['prolog_source']): ?>
<details class="prolog-help">
<summary>Instalar y comprobar SWI-Prolog</summary>
<div class="help-body">
<p>Instala <a href="https://www.swi-prolog.org/Download.html" target="_blank" rel="noopener noreferrer">SWI-Prolog</a> y comprueba que el ejecutable está disponible:</p>
<code>winget install SWI-Prolog.SWI-Prolog</code>
<code>swipl --version</code>
<p>Descarga el código Prolog del proyecto y ejecútalo en su directorio:</p>
<code>swipl -q -s <?= h($currentProject['base']) ?>.pl</code>
<p>Una ejecución correcta muestra <strong>RESULTADO PROLOG: ARBOL COMPLETO</strong>, el objetivo alcanzable y la cadena de dependencias en sintaxis Prolog.</p>
<p><strong>Lectura rápida de las reglas:</strong></p>
<code>a :- b, c. &nbsp; significa: a es cierta si b Y c son ciertas.</code>
<code>a :- (b ; c). &nbsp; significa: a es cierta si b O c es cierta.</code>
<code>a :- b, c, !. &nbsp; significa: alcanzadas b y c, se acepta esa rama y no se prueban alternativas posteriores para a.</code>
<p>El símbolo <code style="display:inline;padding:2px 5px;border:0">!</code> es el corte. Si se escribe otra condición después del corte, por ejemplo <code style="display:inline;padding:2px 5px;border:0">a :- b, c, !, d.</code>, Prolog todavía debe demostrar <code style="display:inline;padding:2px 5px;border:0">d</code>.</p>
<p>DEMUESTRA parte del objetivo final y comprueba dependencias, referencias a conjuntos definidos y fórmulas extraídas. El cierre del árbol no demuestra la verdad matemática de las fórmulas.</p>
<p>Antes de resolverlo, audita todo el grafo y rechaza ciclos, auto-dependencias, referencias inexistentes, nodos duplicados y nodos declarados sin hecho o regla. Los nodos válidos que no intervienen en el objetivo se muestran como aviso informativo.</p>
<p>Una repetición idéntica se informa como redundancia; las definiciones incompatibles se rechazan. Un dossier pendiente puede publicarse con estado NO CERTIFICADO, nunca como resultado final verificado.</p>
</div>
</details>
<?php endif; ?>
<?php endif; ?>
<p id="adec-help" class="sr-only" lang="es"><?= h(ADEC_HELP_ES) ?></p>
<div id="adec-status" class="recommendation" role="status" aria-live="polite" aria-atomic="true" hidden></div>
</main>
<script>
const adecMessages = {
  es: {
    help: <?= json_encode(ADEC_HELP_ES, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) ?>,
    action: 'Descargar el JSON y abrir ADEC en una pestaña nueva',
    preparing: 'Preparando el archivo JSON para ADEC.',
    invalidNodes: 'el JSON no contiene nodos',
    successCopied: (count) => `JSON descargado y URL copiada (${count} ${count === 1 ? 'nodo' : 'nodos'}). En ADEC, pulsa «Carica» y selecciona el archivo en la carpeta Descargas.`,
    success: (count) => `JSON descargado (${count} ${count === 1 ? 'nodo' : 'nodos'}). En ADEC, pulsa «Carica» y selecciona el archivo en la carpeta Descargas.`,
    error: (detail) => `No se pudo preparar ADEC: ${detail}.`,
  },
  en: {
    help: <?= json_encode(ADEC_HELP_EN, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) ?>,
    action: 'Download the JSON and open ADEC in a new tab',
    preparing: 'Preparing the JSON file for ADEC.',
    invalidNodes: 'the JSON does not contain nodes',
    successCopied: (count) => `JSON downloaded and URL copied (${count} ${count === 1 ? 'node' : 'nodes'}). In ADEC, choose “Carica” and select the file from the Downloads folder.`,
    success: (count) => `JSON downloaded (${count} ${count === 1 ? 'node' : 'nodes'}). In ADEC, choose “Carica” and select the file from the Downloads folder.`,
    error: (detail) => `ADEC could not be prepared: ${detail}.`,
  },
};

const browserLanguage = ((navigator.languages && navigator.languages[0]) || navigator.language || '').toLowerCase();
const adecLanguage = browserLanguage.startsWith('es') ? 'es' : 'en';
const adecText = adecMessages[adecLanguage];
const adecHelp = document.getElementById('adec-help');
const adecStatus = document.getElementById('adec-status');

adecHelp.textContent = adecText.help;
adecHelp.lang = adecLanguage;
adecStatus.lang = adecLanguage;

function setAdecStatus(message, busy = false) {
  adecStatus.hidden = false;
  adecStatus.setAttribute('aria-busy', busy ? 'true' : 'false');
  adecStatus.textContent = message;
}

async function copyAdecJson(text) {
  if (navigator.clipboard && navigator.clipboard.writeText) {
    try {
      await Promise.race([
        navigator.clipboard.writeText(text),
        new Promise((_, reject) => window.setTimeout(
          () => reject(new Error('permiso de portapapeles agotado')),
          1200
        )),
      ]);
      return true;
    } catch (error) {
      // Algunos navegadores dejan el permiso pendiente; se usa la copia local.
    }
  }
  const field = document.createElement('textarea');
  field.value = text;
  field.setAttribute('readonly', '');
  field.style.position = 'fixed';
  field.style.opacity = '0';
  document.body.appendChild(field);
  field.select();
  const copied = document.execCommand('copy');
  field.remove();
  return copied;
}

function downloadAdecJson(data, sourceUrl) {
  const blob = new Blob([JSON.stringify(data, null, 2)], {
    type: 'application/json;charset=utf-8',
  });
  const download = document.createElement('a');
  download.href = URL.createObjectURL(blob);
  download.download = new URL(sourceUrl).pathname.split('/').pop() || 'ADEC.json';
  document.body.appendChild(download);
  download.click();
  download.remove();
  window.setTimeout(() => URL.revokeObjectURL(download.href), 1000);
}

document.querySelectorAll('a.adec[data-adec-json]').forEach((link) => {
  link.textContent = link.getAttribute(`data-label-${adecLanguage}`) || link.textContent;
  link.title = adecText.help;
  link.setAttribute('aria-label', adecText.action);
  link.lang = adecLanguage;

  link.addEventListener('click', async () => {
    setAdecStatus(adecText.preparing, true);
    const copyPromise = copyAdecJson(link.dataset.adecJson);
    try {
      const response = await fetch(link.dataset.adecJson, {headers: {'Accept': 'application/json'}});
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const data = await response.json();
      if (!Array.isArray(data.nodes) || data.nodes.length === 0) {
        throw new Error(adecText.invalidNodes);
      }
      downloadAdecJson(data, link.dataset.adecJson);
      const copied = await copyPromise;
      setAdecStatus(copied
        ? adecText.successCopied(data.nodes.length)
        : adecText.success(data.nodes.length));
    } catch (error) {
      setAdecStatus(adecText.error(error.message));
    }
  });
});
</script>
</body></html>
