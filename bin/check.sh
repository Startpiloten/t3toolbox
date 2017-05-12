#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

filecheck=0

checkfiles () {
    echo
    if [ -d t3settings ]
    then
        printf ${GREEN}
        echo 't3settings directory - OK!'
        printf ${NC}
        ((filecheck++))
    else
        printf ${GREEN}
        echo 't3settings directory will be created'
        cp -r vendor/bo/t3toolbox/lib/t3settings t3settings
        printf ${NC}
    fi

    if [ -f t3settings/local.json ]
    then
        printf ${GREEN}
        echo 'local.json - File exists'
        printf ${NC}
        ((filecheck++))
    else
        printf ${RED}
        echo 'local.json - MISSING! > Will be created now'
        cp -r vendor/bo/t3toolbox/lib/t3settings/local.json t3settings/local.json
        printf ${NC}
    fi

    if [ -f t3settings/secret.json ]
    then
        printf ${GREEN}
        echo 'secret.json - File exists'
        printf ${NC}
        ((filecheck++))
    else
        printf ${RED}
        echo 'secret.json - MISSING! > Will be created now'
        cp -r vendor/bo/t3toolbox/lib/t3settings/secret.json t3settings/secret.json
        printf ${NC}
    fi
}

devjsoncheck=0
masterjsoncheck=0
localjsoncheck=0

checkjson () {

    echo
    if [ ${dev_url} = "develop.tld.info" ]
    then
        printf ${RED}
        echo "Develop Server is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Develop Server - OK"
        printf ${NC}
        ((devjsoncheck++))
    fi
    
    if [ ${dev_user} = "p1234" ]
    then
        printf ${RED}
        echo "Develop User is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Develop User - OK"
        printf ${NC}
        ((devjsoncheck++))
    fi
    
    if [ ${dev_path} = "html/develop-dir" ]
    then
        printf ${RED}
        echo "Develop Path is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Develop Path - OK"
        printf ${NC}
        ((devjsoncheck++))
    fi

    echo
    if [ ${master_url} = "master.tld.info" ]
    then
        printf ${RED}
        echo "Master Server is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Master Server - OK"
        printf ${NC}
        ((masterjsoncheck++))
    fi
    
    if [ ${master_user} = "p1234" ]
    then
        printf ${RED}
        echo "Master User is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Master User - OK"
        printf ${NC}
        ((masterjsoncheck++))
    fi
    
    if [ ${master_path} = "html/master-dir" ]
    then
        printf ${RED}
        echo "Master Path is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Master Path - OK"
        printf ${NC}
        ((masterjsoncheck++))
    fi

    echo
    if [ ${local_dbname} = "local_db" ]
    then
        printf ${RED}
        echo "Local Database is not set"
        printf ${NC}
    else
        printf ${GREEN}
        echo  "Local Database - OK"
        printf ${NC}
        ((localjsoncheck++))
    fi
}

checkfiles
source vendor/bo/t3toolbox/bin/load_json.sh
checkjson

if [[ ${localjsoncheck} -eq 1 ]]
then
    localcheck=passed
else
    localcheck=failed
fi

if [[ ${masterjsoncheck} -eq 3 ]]
then
    mastercheck=passed
else
    mastercheck=failed
fi

if [[ ${devjsoncheck} -eq 3 ]]
then
    developcheck=passed
else
    developcheck=failed
fi

echo
echo "Local Check: ${localcheck}"
echo "Develop Check: ${developcheck}"
echo "Master Check: ${mastercheck}"
echo
echo "Check finished!"
echo
