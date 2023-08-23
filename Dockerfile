FROM php:8.2-fpm
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    nano
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# RUN groupadd -g 1000 www
# RUN useradd -u 1000 -ms /bin/bash -g www www
WORKDIR /var/www/html
COPY . /var/www/html
# COPY --chown=www:www . /var/www/html
# USER www
RUN chown -R www-data:www-data /var/www/html/storage

EXPOSE 9000
# CMD ["php-fpm"]