# Docker image for CS325

This repository contains the `Dockerfile` for a Docker image that supports building and running the CS325 coursework.

## Obtaining the Docker image

To use the pre-built image from the GitHub registry, use `docker pull`:
```
docker pull docker.pkg.github.com/mbg/cs325-docker/cs325:latest
```
You can also build the image yourself:
```
git clone https://github.com/mbg/cs325-docker
cd cs325-docker
docker build . -t cs325:latest
```

## Building the compiler

To build the `mccomp` compiler, invoke `docker` as follows, ensuring to replace `/path/to/your/code` with the absolute path to your code:
```
docker run --rm -v /path/to/your/code:/code docker.pkg.github.com/mbg/cs325-docker/cs325:latest
```

## Running a test

To run a test (e.g. `addition`), invoke `docker` as follows, once again ensuring to replace `/path/to/your/code` with the absolute path to your code:
```
docker run --rm -v /path/to/your/code:/code docker.pkg.github.com/mbg/cs325-docker/cs325:latest ./test.sh addition
```
Note that this assumes `mccomp` has already been built and resides in `/path/to/your/code`.

## Running other commands

You can run arbitrary commands inside the container, e.g.:
```
docker run --rm -v /path/to/your/code:/code docker.pkg.github.com/mbg/cs325-docker/cs325:latest /code/mccomp /code/tests/addition/addition.c
```