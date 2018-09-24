#!/bin/sh

set -e

php bin/magento maintenance:enable 
php bin/magento setup:upgrade 
php -d set_time_limit=3600 -d memory_limit=1024M bin/magento setup:di:compile
php -d set_time_limit=3600 -d memory_limit=1024M bin/magento setup:static-content:deploy -f
php bin/magento indexer:reindex
php bin/magento maintenance:disable 
php bin/magento cache:clean 
php bin/magento cache:flush 
bash ./permission.sh

DONE="Success Run."
echo $DONE
