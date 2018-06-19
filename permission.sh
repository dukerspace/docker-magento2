#!/bin/sh

set -e
chmod -R 777 app/etc/
chmod -R 777 var/
chmod -R 777 pub/media/
chmod -R 777 pub/static/
chmod -R 777 generated/

DONE="Permission rewrite"
echo $DONE
