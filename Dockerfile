FROM docker.vivait.co.uk/php:7.3-fpm

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/99_memory-limit.ini

ARG PHPSTAN_VERSION

RUN composer global require phpstan/phpstan-shim "$PHPSTAN_VERSION"

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["phpstan"]