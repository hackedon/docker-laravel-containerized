FROM php:7.4-cli-alpine

RUN apk add --no-cache --update supervisor && rm -rf /var/cache/apk/*

ENV REDIS_VERSION 5.3.1
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$REDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-* /usr/src/php/ext/redis

RUN docker-php-ext-install redis pcntl mysqli pdo pdo_mysql