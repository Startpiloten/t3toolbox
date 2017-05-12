#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

dumplocaldb (){
    echo ${RED}
    echo "Dump Local Database"
    echo ${NC}

    php typo3cms database:export > t3settings/.tmp/${local_dbname}.sql

    echo
    echo
}

if [ ${localcheck} = "passed" ]
then
    dumplocaldb
else
    echo ${RED}
    echo "ERROR - Please check local.json"
    echo ${NC}
fi
