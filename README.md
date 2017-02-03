# Docker image for PHPStan

## Supported tags

- `latest`
- `0.6`

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
alias phpstan="docker run -v $PWD:/app --rm phpstan/phpstan"
```

If you don't have set the alias, use this command to run the container: 

```
docker run --rm -v /path/to/app:/app phpstan/phpstan [some arguments for PHPStan]
```

For example:

```
docker run --rm -v /path/to/app:/app phpstan/phpstan analyse /app/src 
```
