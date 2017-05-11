#!/usr/bin/env bash

if [ -f ~/.profile ]
then
    source ~/.profile
fi

source vendor/bo/t3toolbox/bin/load_json.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color