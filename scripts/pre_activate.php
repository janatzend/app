<?php
require zend_deployment_library_path('ZendServerDeploymentHelper') . '/deph.php';

$deph = new DepH();

#$debugger = $deph->getDebugger();
#$debugger->start('10.0.3.1');

$log = $deph->get('log');
$params = $deph->getParams();

/* 
 * DB SETTINGS
 */
$tplFilename = __DIR__ . '/templates/db.local.php';
$path = $deph->getPath();
$targetFile = $path->getAppsDir() . '/phundament/custom/config/db.local.php';

$template = $deph->getTemplate();
$template->write($tplFilename, $targetFile, [], []);

/*
 * new Module
 */
$tplFilename = __DIR__ . '/templates/module.local.php';
$path = $deph->getPath();
$targetFile = $path->getAppsDir() . '/phundament/custom/config/' . $params->get('MODULE_NAME') . '.local.php';

$search = [
    '#MODULE_NAME#',
    '#MODULE_DB_HOST#',
    '#MODULE_DB_PORT#',
    '#MODULE_DB_NAME#',
    '#MODULE_DB_USER#',
    '#MODULE_DB_PASS#',
];

$replace = [
    $params->get('MODULE_NAME'),
    $params->get('MODULE_DB_HOST'),
    $params->get('MODULE_DB_PORT'),
    $params->get('MODULE_DB_NAME'),
    $params->get('MODULE_DB_USER'),
    $params->get('MODULE_DB_PASS'),
];

$template = $deph->getTemplate();
$template->write($tplFilename, $targetFile, $search, $replace);

/*
 * new Module Class
 */
$tplFilename = __DIR__ . '/templates/Module.php';
$path = $deph->getPath();
$dir = $path->getAppsDir() . '/phundament/custom/extension/' . $params->get('MODULE_NAME');
$shell = $deph->getShell();
$shell->exec("mkdir -p $dir/controllers");
$targetFile = $dir . '/Module.php';

$search = [
    '#MODULE_NAME#'
];

$replace = [
    $params->get('MODULE_NAME')
];

$template = $deph->getTemplate();
$template->write($tplFilename, $targetFile, $search, $replace);
 
/*
 * .env
 */
$tplFilename = __DIR__ . '/templates/.env';
$targetFile = $params->getApplicationBaseDir() . '/.env';
$search = [
    '#APP_ENV#',
    '#APP_NAME#',
    '#APP_TITLE#',
    '#DB_HOST#',
    '#DB_PORT#',
    '#DB_NAME#',
    '#DB_USER#',
    '#DB_PASS#',
];

$replace = [
    $params->get('APP_ENV'),
    $params->get('APP_NAME'),
    $params->get('APP_TITLE'),
    $params->get('DB_HOST'),
    $params->get('DB_PORT'),
    $params->get('DB_NAME'),
    $params->get('DB_USER'),
    $params->get('DB_PASS'),
];

$template = $deph->getTemplate();
$template->write($tplFilename, $targetFile, $search, $replace);

/*
 * assets-gen file HACK, file defined in main.php not available in sources
 * so, it will be created...
 */

$dir = $params->getApplicationBaseDir() . '/src/config/assets-gen';
$shell = $deph->getShell();
$shell->exec("mkdir $dir");
$tplFilename = __DIR__ . '/templates/assets-gen/prod.php';
$targetFile = $dir . '/prod.php';
$template = $deph->getTemplate();
$template->write($tplFilename, $targetFile, [], []);

/*
 * for convenience
 */
$params = $deph->getParams();
$baseDir = $params->getApplicationBaseDir();
$shell = $deph->getShell();
$shell->exec("rm -f /www/phundament");
$shell->exec("ln -s $baseDir /www/phundament");