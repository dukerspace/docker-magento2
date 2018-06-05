#!/bin/sh

set -e
sudo chmod -R 777 app/app/etc/
sudo chmod -R 777 app/var/
sudo chmod -R 777 app/pub/media/
sudo chmod -R 777 app/pub/static/
sudo chmod -R 777 app/generated/

DONE="Permission rewrite"
echo $DONE
