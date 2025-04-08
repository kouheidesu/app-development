FROM php:8.2-cli

WORKDIR /var/www/html

# 拡張とcomposer
RUN apt-get update && apt-get install -y unzip libzip-dev libonig-dev \
    && docker-php-ext-install zip pdo pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN composer install --no-dev --optimize-autoloader
RUN php artisan key:generate
RUN php artisan config:cache
RUN php artisan view:cache

ENV PORT=8080
EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]
