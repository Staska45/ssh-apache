#!/bin/bash
#set -x #uncomment for debug
chown -R www-data:www-data /var/www/app
service apache2 start
service apache2 status
mkdir /var/log/supervisor
cat /keys/id_rsa.pub >> /root/.ssh/authorized_keys
chmod -R go= /root/.ssh
/usr/bin/supervisord
