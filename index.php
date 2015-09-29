<?php
$rootPath = __DIR__ . '/../';

require($rootPath . '/vendor/autoload.php');
require($rootPath . '/src/config/env.php');

defined('YII_DEBUG') or define('YII_DEBUG', (boolean)getenv('YII_DEBUG'));
defined('YII_ENV') or define('YII_ENV', getenv('YII_ENV'));

require($rootPath . '/vendor/yiisoft/yii2/Yii.php');
require($rootPath . '/src/config/bootstrap.php');

$config      = require($rootPath . '/src/config/main.php');

$localConfigPath = realpath($rootPath . 'custom/config');
foreach (glob($localConfigPath . '/*.local.php') as $filename) {
    $local  = require($filename);
    $config = \yii\helpers\ArrayHelper::merge($config, $local);
}

$application = new yii\web\Application($config);
Yii::$app->getAssetManager()->bundles = ['yii\bootstrap\BootstrapAsset' => false];
Yii::$app->getAssetManager()->hashCallback = function($path) {
    if (strpos($path, 'backend/assets') > 0) return 'zendassets';
    $path = (is_file($path) ? dirname($path) : $path) . filemtime($path);
    return sprintf('%x', crc32($path . Yii::getVersion()));
};
$application->run();
