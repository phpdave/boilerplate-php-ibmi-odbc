#!/bin/bash
set -e

# Copy template to actual odbc.ini
cp /etc/odbc.ini.template /etc/odbc.ini

# Replace placeholders with environment variables
sed -i "s|{{DB_SYSTEM}}|${DB_SYSTEM}|g" /etc/odbc.ini
sed -i "s|{{DB_DATABASE}}|${DB_DATABASE}|g" /etc/odbc.ini
sed -i "s|{{DB_USER}}|${DB_USER}|g" /etc/odbc.ini
sed -i "s|{{DB_PASS}}|${DB_PASS}|g" /etc/odbc.ini
sed -i "s|{{DB_LIBRARY_LIST}}|${DB_LIBRARY_LIST}|g" /etc/odbc.ini

chown -R www-data:www-data /var/www/html/logs

exec apache2-foreground