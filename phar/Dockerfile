FROM php:7.1-alpine

ENV PHPSTAN_VERSION 0.7

RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

RUN apk update --no-cache \
    && apk add --no-cache tini \
    && curl -LOs https://github.com/phpstan/phpstan/releases/download/0.7/phpstan-0.7.phar \
    && chmod +x phpstan-0.7.phar \
    && mv phpstan-0.7.phar /usr/local/bin/phpstan \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/phpstan"]
