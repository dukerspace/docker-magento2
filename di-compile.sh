#!/bin/sh

set -e

php -d set_time_limit=3600 -d memory_limit=1024M bin/magento setup:di:compile
php bin/magento cache:clean 
php bin/magento cache:flush 
bash ./permission.sh

DONE="Success DI compile."
echo $DONE
