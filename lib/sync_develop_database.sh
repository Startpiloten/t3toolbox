#!/usr/bin/env bash

source vendor/bo/t3toolbox/lib/lib.sh

echo ${RED}
echo "Testing"
echo ${NC}

echo ${RED}
echo "Backup Local Database before Import"
echo ${NC}

php typo3cms database:export > t3settings/.tmp/${local_dbname}.sql

echo ${RED}
echo "Import Develop Databse now"
echo ${NC}

ssh ${dev_user}@${dev_url} "php_cli ${dev_path}/current/typo3cms database:export" | php typo3cms database:import

echo
echo