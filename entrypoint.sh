#!/bin/bash
set -e

# Load environment variables from .env file
export $(grep -v '^#' /var/www/html/.env | xargs)

# Substitute placeholders in the template to generate actual odbc.ini
envsubst < /etc/odbc.ini.template > /etc/odbc.ini

# Fix permissions if needed
chown -R www-data:www-data /var/www/html/logs

# Run Apache
exec apache2-foreground