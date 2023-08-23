#!/bin/bash
composer install --no-interaction --no-scripts --no-suggest
chmod -R 777 /var/www/html/storage/
php-fpm
#php artisan serve --host=0.0.0.0:80