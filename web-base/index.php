<?php
// Plantilla unica: funciona como indice en /proyectos/ y como ficha al copiarse
// dentro de /proyectos/NOMBRE/. Se mantiene en DEMUESTRA/Proyectos/index.php.
$dir = __DIR__;
$directoryName = basename($dir);

const ADEC_BASE_URL = 'https://sites.google.com/view/numeriprimi-teoremiecongetture/adec-engine/v0-8-6';
const ADEC_ANCHOR = '#h.4q0y44bfwvi3';

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
function text_viewer_url($prefix, $file) {
    $index = $prefix === '' ? 'index.php' : rtrim($prefix, '/') . '/index.php';
    return $index . '?view=' . rawurlencode($file);
}
function status_class($category) {
    $classes = [
        'certified' => 'status-certified',
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
// vista sirve solo archivos de texto permitidos del directorio actual.
if (isset($_GET['view'])) {
    $requested = (string) $_GET['view'];
    $extension = strtolower(pathinfo($requested, PATHINFO_EXTENSION));
    $validName = basename($requested) === $requested
        && preg_match('/\A[A-Za-z0-9_.-]+\z/', $requested)
        && in_array($extension, ['log', 'lean', 'pl'], true);
    $candidate = $validName ? realpath($dir . DIRECTORY_SEPARATOR . $requested) : false;
    $validPath = $candidate !== false
        && is_file($candidate)
        && realpath(dirname($candidate)) === realpath($dir);

    if (!$validPath) {
        http_response_code(404);
        header('Content-Type: text/plain; charset=UTF-8');
        echo "Archivo no disponible.\n";
        exit;
    }

    header('Content-Type: text/plain; charset=UTF-8');
    header('Content-Disposition: inline; filename="' . basename($candidate) . '"');
    header('X-Content-Type-Options: nosniff');
    readfile($candidate);
    exit;
}

function project_info($directory, $base, $urlPrefix = '') {
    $jsonName = $base . '.json';
    if (!is_file($directory . DIRECTORY_SEPARATOR . $jsonName)) return null;
    $data = read_json($directory . DIRECTORY_SEPARATOR . $jsonName);
    $leanEvalName = 'LEAN_' . $base . '.json';
    $leanEval = read_json($directory . DIRECTORY_SEPARATOR . $leanEvalName);
    $prologEvalName = 'PROLOG_' . $base . '.json';
    $prologEval = read_json($directory . DIRECTORY_SEPARATOR . $prologEvalName);
    $prologDirectName = 'PROLOG_MD_DIRECTO_' . $base . '.json';
    $prologDirect = read_json($directory . DIRECTORY_SEPARATOR . $prologDirectName);
    $auditName = 'AUDITORIA_' . $base . '.json';
    $audit = read_json($directory . DIRECTORY_SEPARATOR . $auditName);
    $partialName = 'CERTIFICADO_PARCIAL_LEAN_' . $base . '.json';
    $partial = read_json($directory . DIRECTORY_SEPARATOR . $partialName);
    $trafficName = 'SEMAFORO_' . $base . '.json';
    $traffic = read_json($directory . DIRECTORY_SEPARATOR . $trafficName);
    $prefix = $urlPrefix === '' ? '' : rtrim($urlPrefix, '/') . '/';
    return [
        'base' => $base,
        'url' => $urlPrefix === '' ? './' : $urlPrefix . '/',
        'title' => $data['title'] ?? $base,
        'subtitle' => $data['subtitle'] ?? null,
        'revision' => $data['revision'] ?? null,
        'image' => first_file($directory, [$base . '.jpg', $base . '.jpeg', $base . '.png', $base . '.webp']),
        'pdf' => file_if_exists($directory, $base . '.pdf') ? $prefix . $base . '.pdf' : null,
        'md' => file_if_exists($directory, $base . '.md') ? $prefix . $base . '.md' : null,
        'json' => $prefix . $jsonName,
        'json_version' => filemtime($directory . DIRECTORY_SEPARATOR . $jsonName) ?: null,
        'lean_source' => file_if_exists($directory, $base . '.lean') ? text_viewer_url($urlPrefix, $base . '.lean') : null,
        'lean_md' => file_if_exists($directory, 'LEAN_' . $base . '.md') ? $prefix . 'LEAN_' . $base . '.md' : null,
        'lean_json' => file_if_exists($directory, $leanEvalName) ? $prefix . $leanEvalName : null,
        'lean_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $leanEvalName) ? filemtime($directory . DIRECTORY_SEPARATOR . $leanEvalName) : null,
        'lean_log' => file_if_exists($directory, 'LEAN_' . $base . '.log') ? text_viewer_url($urlPrefix, 'LEAN_' . $base . '.log') : null,
        'lean_verdict' => $leanEval['verdict'] ?? null,
        'lean_passed' => array_key_exists('passed', $leanEval) ? (bool) $leanEval['passed'] : null,
        'prolog_source' => file_if_exists($directory, $base . '.pl') ? text_viewer_url($urlPrefix, $base . '.pl') : null,
        'prolog_md' => file_if_exists($directory, 'PROLOG_' . $base . '.md') ? $prefix . 'PROLOG_' . $base . '.md' : null,
        'prolog_json' => file_if_exists($directory, $prologEvalName) ? $prefix . $prologEvalName : null,
        'prolog_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $prologEvalName) ? filemtime($directory . DIRECTORY_SEPARATOR . $prologEvalName) : null,
        'prolog_log' => file_if_exists($directory, 'PROLOG_' . $base . '.log') ? text_viewer_url($urlPrefix, 'PROLOG_' . $base . '.log') : null,
        'prolog_verdict' => $prologEval['verdict'] ?? null,
        'prolog_direct_md' => file_if_exists($directory, 'PROLOG_MD_DIRECTO_' . $base . '.md') ? $prefix . 'PROLOG_MD_DIRECTO_' . $base . '.md' : null,
        'prolog_direct_json' => file_if_exists($directory, $prologDirectName) ? $prefix . $prologDirectName : null,
        'prolog_direct_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $prologDirectName) ? filemtime($directory . DIRECTORY_SEPARATOR . $prologDirectName) : null,
        'prolog_direct_log' => file_if_exists($directory, 'PROLOG_MD_DIRECTO_' . $base . '.log') ? text_viewer_url($urlPrefix, 'PROLOG_MD_DIRECTO_' . $base . '.log') : null,
        'prolog_direct_verdict' => $prologDirect['verdict'] ?? null,
        'prolog_direct_refuted' => array_key_exists('refuted', $prologDirect) ? (bool) $prologDirect['refuted'] : null,
        'open_obligations' => is_array($prologDirect['open_obligations'] ?? null) ? $prologDirect['open_obligations'] : [],
        'audit_md' => file_if_exists($directory, 'AUDITORIA_' . $base . '.md') ? $prefix . 'AUDITORIA_' . $base . '.md' : null,
        'audit_json' => file_if_exists($directory, $auditName) ? $prefix . $auditName : null,
        'audit_json_version' => is_file($directory . DIRECTORY_SEPARATOR . $auditName) ? filemtime($directory . DIRECTORY_SEPARATOR . $auditName) : null,
        'audit_log' => file_if_exists($directory, 'AUDITORIA_' . $base . '.log') ? text_viewer_url($urlPrefix, 'AUDITORIA_' . $base . '.log') : null,
        'audit_verdict' => $audit['verdict'] ?? null,
        'classifications' => is_array($audit['classifications'] ?? null) ? $audit['classifications'] : [],
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
</style></head>
<body class="<?= $isProjectPage ? 'project-page' : 'projects-page' ?>">
<header><div class="wrap top"><h1>DEMUESTRA</h1><span class="muted"><?= $isProjectPage ? h($currentProject['base']) : count($projects) . ' proyecto' . (count($projects) === 1 ? '' : 's') ?></span></div></header>
<main class="wrap">
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
$prologCategory = $classificationByEvaluator['Prolog estructural']['category'] ?? 'inconclusive';
$directCategory = $classificationByEvaluator['Prolog directo del MD']['category'] ?? 'inconclusive';
?>
<article>
<div class="image"><?php if ($project['image']): ?><img src="<?= h(($isProjectPage ? '' : rawurlencode($project['base']) . '/') . $project['image']) ?>" alt="<?= h($project['title']) ?>"><?php endif; ?></div>
<div class="body"><div class="meta"><strong><?= h($project['base']) ?></strong><?php if ($project['revision']): ?><span>rev. <?= h($project['revision']) ?></span><?php endif; ?><span class="badge <?= h(status_class($leanCategory)) ?>"><?= h($project['publication_status']) ?></span><span class="badge <?= h(status_class($leanCategory)) ?>">Lean: <?= h($project['lean_verdict'] ?? 'SIN EVALUAR') ?></span><span class="badge <?= h(status_class($prologCategory)) ?>">Prolog estructural: <?= h($project['prolog_verdict'] ?? 'SIN EVALUAR') ?></span><span class="badge <?= h(status_class($directCategory)) ?>">Prolog directo: <?= h($project['prolog_direct_verdict'] ?? 'SIN EVALUAR') ?></span><span class="badge status-inconclusive">Auditoría: <?= h($project['audit_verdict'] ?? 'SIN EVALUAR') ?></span></div><h2><?= h($project['title']) ?></h2><?php if ($project['subtitle']): ?><p><?= h($project['subtitle']) ?></p><?php endif; ?><?php if ($project['publication_status'] !== 'CERTIFICADO'): ?><p>Documento publicado para examen. Cada evaluador conserva su veredicto independiente: un error de herramienta no es una refutación matemática.</p><?php endif; ?></div>
<?php if ($isProjectPage && $project['classifications']): ?>
<section class="assessment" aria-label="Clasificación de la evaluación">
<div class="traffic <?= h(traffic_class($project['traffic_color'])) ?>"><span class="traffic-light" aria-hidden="true"></span><div><strong>Comparación: <?= h(str_replace('_', ' ', $project['traffic_state'])) ?></strong><?php foreach ($project['traffic_regressions'] as $reason): ?><p><?= h($reason) ?></p><?php endforeach; ?><?php foreach ($project['traffic_improvements'] as $reason): ?><p><?= h($reason) ?></p><?php endforeach; ?><?php if (!$project['traffic_regressions'] && !$project['traffic_improvements']): ?><p>No hay un cambio probatorio relevante respecto de la evaluación anterior.</p><?php endif; ?><?php if ($project['rollback_available']): ?><p><strong>Marcha atrás habilitada:</strong> la evaluación anterior permanece íntegra en <code>anterior</code>.</p><?php endif; ?></div></div>
<h3>Qué certifica y qué queda abierto</h3>
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
<?php if ($project['pdf']): ?><a class="primary" href="<?= h($project['pdf']) ?>">PDF</a><?php endif; ?>
<?php if ($project['md']): ?><a href="<?= h($project['md']) ?>">MD</a><?php endif; ?>
<?php if ($project['traffic_json']): ?><a class="semaphore traffic-<?= h($project['traffic_color']) ?>" href="<?= h($project['traffic_json']) ?>">Semáforo</a><?php endif; ?>
<?php if ($project['json']): ?><a href="<?= h($project['json']) ?>">JSON principal</a><a class="adec" title="Descarga el JSON y abre ADEC; cargalo alli con Carica" data-adec-json="<?= h(adec_json_url($project['json'], $project['json_version'])) ?>" href="<?= h(adec_url_for_json($project['json'], $project['json_version'])) ?>" target="_blank" rel="noopener noreferrer">Descargar + ADEC</a><?php endif; ?>
<?php if (!$isProjectPage): ?><a class="enter" href="<?= h($project['url']) ?>">Entrar al proyecto →</a><?php endif; ?>
</div>
<?php if ($isProjectPage): ?>
<section class="analysis-actions" aria-label="Análisis independientes">
<div class="analysis-row <?= h(status_class($leanCategory)) ?>"><div class="analysis-label"><strong>Lean</strong><span><?= h($project['lean_verdict'] ?? 'SIN EVALUAR') ?></span></div><div class="analysis-links"><?php if ($project['lean_md']): ?><a class="primary" href="<?= h($project['lean_md']) ?>">Informe</a><?php else: ?><a class="disabled">Sin evaluar</a><?php endif; ?><?php if ($project['lean_json']): ?><a href="<?= h($project['lean_json']) ?>">JSON</a><a class="adec" title="Descarga el JSON y abre ADEC; cargalo alli con Carica" data-adec-json="<?= h(adec_json_url($project['lean_json'], $project['lean_json_version'])) ?>" href="<?= h(adec_url_for_json($project['lean_json'], $project['lean_json_version'])) ?>" target="_blank" rel="noopener noreferrer">ADEC</a><?php endif; ?><?php if ($project['lean_log']): ?><a href="<?= h($project['lean_log']) ?>">Salida</a><?php endif; ?><?php if ($project['lean_source']): ?><a href="<?= h($project['lean_source']) ?>">Código</a><?php endif; ?></div></div>
<?php if ($project['partial_json']): ?><div class="analysis-row status-conditional"><div class="analysis-label"><strong>Certificado Lean parcial</strong><span><?= h($project['partial_certified_count']) ?> nodos certificados</span></div><div class="analysis-links"><a class="evidence" href="<?= h($project['partial_json']) ?>">Certificado JSON</a><a class="adec" title="Descarga el JSON y abre ADEC; cargalo alli con Carica" data-adec-json="<?= h(adec_json_url($project['partial_json'], $project['partial_json_version'])) ?>" href="<?= h(adec_url_for_json($project['partial_json'], $project['partial_json_version'])) ?>" target="_blank" rel="noopener noreferrer">ADEC</a></div></div><?php endif; ?>
<div class="analysis-row <?= h(status_class($prologCategory)) ?>"><div class="analysis-label"><strong>Prolog estructural</strong><span><?= h($project['prolog_verdict'] ?? 'SIN EVALUAR') ?></span></div><div class="analysis-links"><?php if ($project['prolog_md']): ?><a class="primary" href="<?= h($project['prolog_md']) ?>">Informe</a><?php endif; ?><?php if ($project['prolog_json']): ?><a href="<?= h($project['prolog_json']) ?>">JSON</a><a class="adec" title="Descarga el JSON y abre ADEC; cargalo alli con Carica" data-adec-json="<?= h(adec_json_url($project['prolog_json'], $project['prolog_json_version'])) ?>" href="<?= h(adec_url_for_json($project['prolog_json'], $project['prolog_json_version'])) ?>" target="_blank" rel="noopener noreferrer">ADEC</a><?php endif; ?><?php if ($project['prolog_log']): ?><a href="<?= h($project['prolog_log']) ?>">Salida</a><?php endif; ?><?php if ($project['prolog_source']): ?><a href="<?= h($project['prolog_source']) ?>">Código</a><?php endif; ?></div></div>
<div class="analysis-row <?= h(status_class($directCategory)) ?>"><div class="analysis-label"><strong>Prolog directo del MD</strong><span><?= h($project['prolog_direct_verdict'] ?? 'SIN EVALUAR') ?></span></div><div class="analysis-links"><?php if ($project['prolog_direct_md']): ?><a class="primary" href="<?= h($project['prolog_direct_md']) ?>">Informe</a><?php endif; ?><?php if ($project['prolog_direct_json']): ?><a href="<?= h($project['prolog_direct_json']) ?>">JSON</a><a class="adec" title="Descarga el JSON y abre ADEC; cargalo alli con Carica" data-adec-json="<?= h(adec_json_url($project['prolog_direct_json'], $project['prolog_direct_json_version'])) ?>" href="<?= h(adec_url_for_json($project['prolog_direct_json'], $project['prolog_direct_json_version'])) ?>" target="_blank" rel="noopener noreferrer">ADEC</a><?php endif; ?><?php if ($project['prolog_direct_log']): ?><a href="<?= h($project['prolog_direct_log']) ?>">Salida</a><?php endif; ?></div></div>
<div class="analysis-row status-inconclusive"><div class="analysis-label"><strong>Auditoría final</strong><span><?= h($project['audit_verdict'] ?? 'SIN EVALUAR') ?></span></div><div class="analysis-links"><?php if ($project['audit_md']): ?><a class="primary" href="<?= h($project['audit_md']) ?>">Informe</a><?php endif; ?><?php if ($project['audit_json']): ?><a href="<?= h($project['audit_json']) ?>">JSON</a><a class="adec" title="Descarga el JSON y abre ADEC; cargalo alli con Carica" data-adec-json="<?= h(adec_json_url($project['audit_json'], $project['audit_json_version'])) ?>" href="<?= h(adec_url_for_json($project['audit_json'], $project['audit_json_version'])) ?>" target="_blank" rel="noopener noreferrer">ADEC</a><?php endif; ?><?php if ($project['audit_log']): ?><a href="<?= h($project['audit_log']) ?>">Salida</a><?php endif; ?></div></div>
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
<div id="adec-status" class="recommendation" role="status" hidden></div>
</main>
<script>
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
  link.addEventListener('click', async () => {
    const status = document.getElementById('adec-status');
    const copyPromise = copyAdecJson(link.dataset.adecJson);
    try {
      const response = await fetch(link.dataset.adecJson, {headers: {'Accept': 'application/json'}});
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const data = await response.json();
      if (!Array.isArray(data.nodes) || data.nodes.length === 0) {
        throw new Error('el JSON no contiene nodes');
      }
      downloadAdecJson(data, link.dataset.adecJson);
      const copied = await copyPromise;
      status.textContent = copied
        ? `JSON descargado y URL copiada (${data.nodes.length} nodos). Usa Carica en ADEC.`
        : `JSON descargado (${data.nodes.length} nodos). Cárgalo en ADEC.`;
      status.hidden = false;
    } catch (error) {
      status.textContent = `No se pudo preparar ADEC: ${error.message}.`;
      status.hidden = false;
    }
  });
});
</script>
</body></html>
