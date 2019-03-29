# Docker image for [PHPStan](https://github.com/phpstan/phpstan) - PHP Static Analysis Tool

[![Docker Stars](https://img.shields.io/docker/stars/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)
[![Docker Pulls](https://img.shields.io/docker/pulls/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)

The image is based on [Alpine Linux](https://alpinelinux.org/) and built daily.

## Supported tags

- `0.11`, `latest`
- `0.10`
- `nightly` (dev-master)

## How to use this image

### Install

Install the container:

```
docker pull phpstan/phpstan
```

Alternatively, pull a specific version:

```
docker pull phpstan/phpstan:0.11
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

#### Install PHPStan extensions
If you need an PHPStan extension, for example [phpstan/phpstan-phpunit](https://github.com/phpstan/phpstan-phpunit), you can simply
extend an existing image and add the relevant extension via Composer.
In some cases you need also some additional PHP extensions like DOM. (see section below)

Here is an example Dockerfile for phpstan/phpstan-phpunit:

```
FROM phpstan/phpstan:0.11
RUN apk --update --progress --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community add \
    php7-dom \
    php7-xmlwriter \
    && composer global require phpstan/phpstan-phpunit
```

If installed globally, you can update the `phpstan.neon` or `phpstan.neon.dist` file in order to use the extension:
```neon
includes:
    - /composer/vendor/phpstan/phpstan-phpunit/extension.neon
```

#### Further PHP extension support
Sometimes your codebase requires some additional PHP extensions like "intl"
or maybe "soap".

Therefore you need to know that our Docker image extends the [official alpine Docker image](https://github.com/gliderlabs/docker-alpine).
So only [a subset of extensions are pre-installed](https://github.com/phpstan/docker-image/blob/master/base/Dockerfile#L11-L32).
Also because PHPStan needs no further extensions to run itself.

But to solve this issue you can extend our Docker image in an own Dockerfile like this, for example to add "soap" and "intl":

```
FROM phpstan/phpstan:latest
RUN apk --update --progress --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community add \
    icu-dev \
    libxml2-dev \
    php7-soap \
    php7-intl
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
