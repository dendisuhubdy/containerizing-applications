#!/bin/bash
set -eux

MYDIR=$(dirname $0)

# Perform configurations
$MYDIR/config_mariadb.sh
$MYDIR/config_apache.sh
$MYDIR/config_wordpress.sh

# Start mariadb in the background
/usr/bin/mysqld_safe &

# Start the fpm server
/usr/sbin/php-fpm

# Start apache in the foreground
/usr/sbin/httpd -D FOREGROUND
