FROM php:7.4-cli
RUN pecl install redis-5.1.1 \
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable redis xdebug

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apt update && apt install -y supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY laravel-scheduler.conf /etc/supervisor/conf.d/laravel-scheduler.conf