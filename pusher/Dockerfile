FROM php:7.4-cli
WORKDIR /
RUN pecl install xdebug-2.8.1 && \
    docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo

RUN apt update && \
    apt install -y supervisor git zip unzip

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY laravel-pusher.conf /etc/supervisor/conf.d/laravel-pusher.conf

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN composer create-project --prefer-dist laravel/laravel app
COPY env /app/.env
RUN touch /app/database/database.sqlite
RUN cd /app && \
    composer require beyondcode/laravel-websockets && \
    php artisan vendor:publish --provider="BeyondCode\LaravelWebSockets\WebSocketsServiceProvider" --tag="migrations" && \
    php artisan migrate && \
    php artisan vendor:publish --provider="BeyondCode\LaravelWebSockets\WebSocketsServiceProvider" --tag="config"

# Clean up
RUN apt-get purge -y git zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog && \
    rm -rf /root/.composer

EXPOSE 6001