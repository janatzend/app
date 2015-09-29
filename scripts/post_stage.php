<?php
require zend_deployment_library_path('ZendServerDeploymentHelper') . '/deph.php';

$deph = new DepH();

#$debugger = $deph->getDebugger();
#$debugger->start('10.0.3.1');

$log = $deph->get('log');

$path = $deph->getPath();
$params = $deph->getParams();

$persistentAssests = $path->getAppsDir() . '/phundament/web/assets';
$packageAssets = $params->getApplicationBaseDir() . '/web/assets';

$persistentRuntime = $path->getAppsDir() . '/phundament/runtime';
$packageRuntime = $params->getApplicationBaseDir() . '/runtime';

$path->createWriteableDir($persistentAssests);
$path->createWriteableDir($persistentRuntime);

$shell = $deph->getShell();
$uid = $params->getWebserverUid();
$gid = $params->getWebserverGid();

$shell->exec("mv $packageAssets/* $persistentAssests");
$shell->exec("rm -rf $packageAssets");
$shell->exec("ln -s $persistentAssests $packageAssets");
$shell->exec("chown -R $uid:$gid $persistentAssests");
$shell->exec("chmod -R 0775 $persistentAssests");

$shell->exec("mv $packageRuntime/* $persistentRuntime");
$shell->exec("rm -rf $packageRuntime");
$shell->exec("ln -s $persistentRuntime $packageRuntime");
$shell->exec("chown -R $uid:$gid $persistentRuntime");
$shell->exec("chmod -R 0775 $persistentRuntime");

/*
 * prepare dirs for code generation from giiant
 */
$persistentCustom = $path->getAppsDir() . '/phundament/custom';
$packageCustom = $params->getApplicationBaseDir() . '/custom';
$shell = $deph->getShell();
$uid = $params->getWebserverUid();
$gid = $params->getWebserverGid();
$shell->exec("mv $packageCustom $persistentCustom");
$shell->exec("ln -s $persistentCustom $packageCustom");
if ($params->get('APP_ENV') == 'dev') {
    $shell->exec("chown -R $uid:$gid $persistentCustom");
    $shell->exec("chmod -R 0775 $persistentCustom");
}
