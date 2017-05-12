#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

syncmasterdb () {
    echo ${RED}
    echo "Backup Local Database before Import"
    echo ${NC}

    php typo3cms database:export > t3settings/.tmp/${local_dbname}_backup.sql

    echo ${RED}
    echo "Import Develop Databse now"
    echo ${NC}

    ssh ${master_user}@${master_url} "php_cli ${master_path}/current/typo3cms database:export" | php typo3cms database:import

    echo
    echo
}

if [ ${developcheck} = "passed" ] && [ ${localcheck} = "passed" ]
then
    syncdevdb
else
    echo ${RED}
    echo "ERROR - Please check local.json and secret.json"
    echo ${NC}
fi
