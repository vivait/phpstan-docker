FROM phpstan/phpstan:base
MAINTAINER Tommy Muehle <tommy.muehle@gmail.com>

ENV PHPSTAN_VERSION 0.8.x

RUN composer global require phpstan/phpstan ^0.8 \
    && composer global show | grep phpstan
