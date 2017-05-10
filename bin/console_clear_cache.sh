#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

echo ${RED}
echo "Remove typo3temp Files"
echo ${NC}

rm -rfv web/typo3temp/*

echo ${RED}
echo "Clear Caches Now"
echo ${NC}

php typo3cms cache:flush --force

echo ${RED}
echo "Fix Folder Structure"
echo ${NC}

php typo3cms install:fixfolderstructure

echo
echo