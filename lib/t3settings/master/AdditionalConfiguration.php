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
$GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = '0';
$GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = '0';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['devIPmask'] = '*';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = '0';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['enableDeprecationLog'] = '';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = '0';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLogLevel'] = '0';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['exceptionalErrors'] = '';
