#!/bin/sh

set -e

function echocolor() { # $1 = string
    COLOR='\033[1;32m'
    NC='\033[0m'
    printf "${COLOR}$1${NC}\n"
}

php bin/magento cache:clean 
php bin/magento cache:flush 
bash ./permission.sh

DONE="Success clean cache."
echocolor $DONE
