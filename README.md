# Docker image for PHPStan

[![Build Status](https://travis-ci.org/phpstan/docker-image.svg?branch=master)](https://travis-ci.org/phpstan/docker-image)
[![Docker Automated build](https://img.shields.io/docker/automated/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)
[![Docker Stars](https://img.shields.io/docker/stars/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)
[![Docker Pulls](https://img.shields.io/docker/pulls/phpstan/phpstan.svg)](https://hub.docker.com/r/phpstan/phpstan/)

[PHPStan](https://github.com/phpstan/phpstan) - PHP Static Analysis Tool. The image is based on [Alpine Linux](https://alpinelinux.org/) and built daily. 

## Supported tags

- `latest` [(latest/Dockerfile)](latest/Dockerfile)
- `0.6` [(0.6/Dockerfile)](0.6/Dockerfile)

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
