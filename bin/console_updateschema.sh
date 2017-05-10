#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

echo ${RED}
echo "Update database schema"
echo ${NC}

php typo3cms database:updateschema --safe

echo
echo
