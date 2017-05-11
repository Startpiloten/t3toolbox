#!/usr/bin/env bash

#################
### Load JSON ###
#################

dev_url=$(cat t3settings/secret.json | jq '.develop.host.url' | sed -e 's/^"//'  -e 's/"$//')
dev_user=$(cat t3settings/secret.json | jq '.develop.host.user' | sed -e 's/^"//'  -e 's/"$//')
dev_path=$(cat t3settings/secret.json | jq '.develop.host.path' | sed -e 's/^"//'  -e 's/"$//')

master_url=$(cat t3settings/secret.json | jq '.master.host.url' | sed -e 's/^"//'  -e 's/"$//')
master_user=$(cat t3settings/secret.json | jq '.master.host.user' | sed -e 's/^"//'  -e 's/"$//')
master_path=$(cat t3settings/secret.json | jq '.master.host.path' | sed -e 's/^"//'  -e 's/"$//')

local_dbname=$(cat t3settings/local.json | jq '.database.name' | sed -e 's/^"//'  -e 's/"$//')
local_dbuser=$(cat t3settings/local.json | jq '.database.user' | sed -e 's/^"//'  -e 's/"$//')
local_dbpassword=$(cat t3settings/local.json | jq '.database.password' | sed -e 's/^"//'  -e 's/"$//')
local_dbhost=$(cat t3settings/local.json | jq '.database.host' | sed -e 's/^"//'  -e 's/"$//')
local_domain=$(cat t3settings/local.json | jq '.general.localdomain' | sed -e 's/^"//'  -e 's/"$//')

#######################
### Load JSON - END ###
#######################