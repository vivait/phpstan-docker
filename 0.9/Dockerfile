FROM phpstan/phpstan:base
MAINTAINER Tommy Muehle <tommy.muehle@gmail.com>

ENV PHPSTAN_VERSION 0.9.x

RUN composer global require phpstan/phpstan ^0.9 \
    && composer global show | grep phpstan
