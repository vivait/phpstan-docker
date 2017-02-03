FROM phpstan/phpstan:base
MAINTAINER Tommy Muehle <tommy.muehle@gmail.com>

ENV PHPSTAN_VERSION dev-master

RUN composer global require phpstan/phpstan dev-master --prefer-dist \
    && composer global show | grep phpstan
