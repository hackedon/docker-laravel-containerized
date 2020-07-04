FROM php:7.4-cli
RUN pecl install redis-5.1.1 \
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable redis xdebug

RUN docker-php-ext-install mysqli pdo pdo_mysql pcntl

RUN apt update && apt install -y supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY laravel-horizon-worker.conf /etc/supervisor/conf.d/laravel-horizon-worker.conf

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog