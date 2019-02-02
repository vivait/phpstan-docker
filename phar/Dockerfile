FROM alpine:3.8

ENV PHPSTAN_VERSION 0.11

RUN apk --update --progress --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/community add \
    curl \
    php7 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-ftp \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mysqlnd \
    php7-openssl \
    php7-pdo \
    php7-pdo_sqlite \
    php7-phar \
    php7-posix \
    php7-session \
    php7-simplexml \
    php7-sqlite3 \
    php7-tokenizer \
    php7-xml \
    php7-xmlreader \
    php7-xmlwriter \
    php7-zlib \
    && curl -LOs https://github.com/phpstan/phpstan/releases/download/$PHPSTAN_VERSION/phpstan.phar \
    && chmod +x phpstan.phar \
    && mv phpstan.phar /usr/local/bin/phpstan \
    && echo "memory_limit=-1" > /etc/php7/conf.d/99_memory-limit.ini \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/usr/local/bin/phpstan"]
