#!/bin/bash
set -e

# Load environment variables from .env file
export $(grep -v '^#' /var/www/html/.env | xargs)

cp /etc/odbc.ini.template /etc/odbc.ini

# Substitute placeholders in the template to generate actual odbc.ini
sed -i "s/{{DB_SYSTEM}}/${DB_SYSTEM}/g" /etc/odbc.ini
sed -i "s/{{DB_DATABASE}}/${DB_DATABASE}/g" /etc/odbc.ini
sed -i "s/{{DB_USER}}/${DB_USER}/g" /etc/odbc.ini
sed -i "s/{{DB_PASS}}/${DB_PASS}/g" /etc/odbc.ini
sed -i "s/{{DB_LIBRARY_LIST}}/${DB_LIBRARY_LIST}/g" /etc/odbc.ini

# Fix permissions if needed
chown -R www-data:www-data /var/www/html/logs

# Run Apache
exec apache2-foreground