#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

echo ${RED}
echo "Remove typo3temp Files"
echo ${NC}

rm -rfv public/typo3temp/*

echo ${RED}
echo "Fix Folder Structure"
echo ${NC}

php typo3cms install:fixfolderstructure

echo ${RED}
echo "Clear Caches Now"
echo ${NC}

php typo3cms cache:flush --force

if [ -f public/flush_cache.php ]
then
echo ${RED}
echo "Clear Optcache Now"
curl -insecure http://${local_domain}/flush_cache.php?token=clearcache
echo ${NC}
else
cp -r vendor/bo/t3toolbox/lib/flush_cache.php web/flush_cache.php
echo ${RED}
echo "Clear Optcache Now"
curl -insecure http://${local_domain}/flush_cache.php?token=clearcache
echo ${NC}
fi

if ! [ -f web/typo3conf/ENABLE_INSTALL_TOOL ]
then
touch web/typo3conf/ENABLE_INSTALL_TOOL
fi

echo
echo
