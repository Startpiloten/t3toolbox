<?php

$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections'] = [
    'Default' => [
        'charset' => 'utf8',
        'dbname' => '',
        'driver' => 'mysqli',
        'host' => '',
        'password' => '',
        'port' => 3306,
        'user' => '',
    ]
];

// debug
$GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = '1';
$GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = '1';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['devIPmask'] = '*';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = '1';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['enableDeprecationLog'] = 'file';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = '1';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLogLevel'] = '0';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['exceptionalErrors'] = '28674';
