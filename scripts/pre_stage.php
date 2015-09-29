<?php
require zend_deployment_library_path('ZendServerDeploymentHelper') . '/deph.php';

$deph = new DepH();

$sql = __DIR__ . '/templates/phundament.sql';

$params = $deph->getParams();
$mysqlClient = $params->get('MYSQL_CLIENT_PATH');
$user = $params->get('DB_USER');
$pass = $params->get('DB_PASS');
$host = $params->get('DB_HOST');
$port = $params->get('DB_PORT');

$shell = $deph->getShell();
$shell->exec("$mysqlClient -u $user -p{$pass} -h $host -P $port < $sql");