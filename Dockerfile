FROM php:8.2-cli

# 依存パッケージのインストール
RUN apt-get update && apt-get install -y \
    unzip curl libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# Composer インストール
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# 作業ディレクトリ
WORKDIR /var/www/html

# アプリケーションのコードをコピー
COPY . .

# ✅ 依存関係をインストール（←ここ！）
RUN composer install --no-dev --optimize-autoloader

# 公開ディレクトリとポート
ENV PORT=8000
EXPOSE 8000

# アプリ起動
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT -t public"]
