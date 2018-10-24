#!/bin/sh

set -e

php -d set_time_limit=3600 -d memory_limit=1024M bin/magento setup:static-content:deploy -f
php bin/magento cache:clean 
php bin/magento cache:flush 
bash ./permission.sh

DONE="Success static content deploy."
echo $DONE
