#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

echo ${RED}
echo "Get Fileadmin and Uploads from Develop"
echo ${NC}

if [ -d "web/fileadmin" ]
then
    rsync -avz --exclude '**/_processed_' ${dev_user}@${dev_url}:${dev_path}/fileadmin/* web/fileadmin
else
    echo "WARING!! - No Local Fileadmin found in web/fileadmin"
    echo
    exit
fi

if [ -d "web/uploads" ]
then
    rsync -avz --exclude ${dev_user}@${dev_url}:${dev_path}/uploads/* web/uploads
else
    echo "WARING!! -  No Local Uploads found in web/uploads"
    echo
    exit
fi

echo
echo