#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

echo ${RED}
echo "Get Fileadmin and Uploads from Develop"
echo ${NC}

if [ -d "web/fileadmin" ]
then
    rsync -avz --exclude '**/_processed_' ${master_user}@${master_url}:${master_path}/fileadmin/* web/fileadmin
else
    echo "WARING!! - No Local Fileadmin folder found in web/fileadmin"
    echo
    exit
fi

if [ -d "web/uploads" ]
then
    rsync -avz --exclude ${master_user}@${master_url}:${master_path}/uploads/* web/uploads
else
    echo "WARING!! -  No Local Uploads folder found in web/uploads"
    echo
    exit
fi

echo
echo