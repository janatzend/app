<?php
return [ 
    'components' => [
        'db_#MODULE_NAME#' => [
            'class'       => 'yii\db\Connection',
            'dsn'         => 'mysql:host=#MODULE_DB_HOST#;port=#MODULE_DB_PORT#;dbname=#MODULE_DB_NAME#',
            'username'    => '#MODULE_DB_USER#',
            'password'    => '#MODULE_DB_PASS#',
            'charset'     => 'utf8',
            'tablePrefix' => '',
        ]
    ],
    'modules' => [
        '#MODULE_NAME#' => [
            'class' => 'extension\#MODULE_NAME#\Module',
        ],
    ]
];