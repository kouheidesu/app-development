FROM php:8.2-cli

# Install required extensions
RUN apt-get update && apt-get install -y \
    libzip-dev unzip \
    && docker-php-ext-install zip pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Set port and expose it
ENV PORT=8000
EXPOSE 8000

# Start Laravel
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT -t public"]
