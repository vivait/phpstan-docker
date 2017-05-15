# Docker image for [PHPStan](https://github.com/phpstan/phpstan) - PHP Static Analysis Tool

[![Build Status](https://travis-ci.org/phpstan/docker-image.svg?branch=master)](https://travis-ci.org/phpstan/docker-image)
[![Docker Automated build](https://img.shields.io/docker/automated/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)
[![Docker Stars](https://img.shields.io/docker/stars/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)
[![Docker Pulls](https://img.shields.io/docker/pulls/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)

The image is based on [Alpine Linux](https://alpinelinux.org/) and built daily.

## Supported tags

- `latest` [(latest/Dockerfile)](latest/Dockerfile)
- `0.6` [(0.6/Dockerfile)](0.6/Dockerfile)
- `0.7` [(0.7/Dockerfile)](0.7/Dockerfile)

## How to use this image

### Install

Install the container:

```
docker pull phpstan/phpstan
```

Alternatively, pull a specific version:

```
docker pull phpstan/phpstan:0.6
```

### Usage

We are recommend to use the images as an shell alias to access via short-command.
To use simply *phpstan* everywhere on CLI add this line to your ~/.zshrc, ~/.bashrc or ~/.profile.

```
alias phpstan='docker run -v $PWD:/app --rm phpstan/phpstan'
```

If you don't have set the alias, use this command to run the container:

```
docker run --rm -v /path/to/app:/app phpstan/phpstan [some arguments for PHPStan]
```

For example:

```
docker run --rm -v /path/to/app:/app phpstan/phpstan analyse /app/src
```

### Customizing

#### Further PHP extension support
Sometimes your codebase requires some additional PHP extensions like "intl"
or maybe "soap". 

Therefore you need to know that our Docker image extends the [official PHP 7.1 Docker image](https://github.com/docker-library/php/blob/76a1c5ca161f1ed6aafb2c2d26f83ec17360bc68/7.1/alpine/Dockerfile) 
and so only a subset of configured extensions are available. Also because PHPStan needs no further extensions to run itself.

But to solve this issue you can extend our Docker image in an own Dockerfile like this, for example to add "soap" and "intl":

```
FROM phpstan/phpstan:latest
RUN apk add --no-cache --virtual .persistent-deps icu-dev libxml2-dev \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure soap --enable-soap \
    && docker-php-ext-install intl \
    && docker-php-ext-install soap
```

#### Missing classes like "PHPUnit_Framework_TestCase"

Often you use PHAR files like PHPUnit in your projects. These PHAR files provide sometimes own classes 
where your project classes extends from. But these cannot be found in
the vendor directory and so cannot be autoloaded. So you see error messages like this:
*"Fatal error: Class 'PHPUnit_Framework_TestCase' not found"*

To solve this issue you need an own configuration file, like "phpstan.neon".
This file can look like this:

```
parameters:
	autoload_files:
		- path/to/phpunit.phar
```

After creating this file in your project root you can run PHPStan for example via

```
docker run -v $PWD:/app --rm phpstan/phpstan -c phpstan.neon --level=4
```

and now the required classes are loaded. Please take also a look in the [relevant part](https://github.com/phpstan/phpstan#autoloading) at the PHPStan documentation.
