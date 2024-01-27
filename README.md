# Rawgraphs 2.0 in a docker container
[![build](https://github.com/hvalev/rawgraphs2.0-docker/actions/workflows/build.yml/badge.svg)](https://github.com/hvalev/rawgraphs2.0-docker/actions/workflows/build.yml)
![Rawgraphs2.0 version](https://img.shields.io/badge/version-2.0.1-brightgreen)
![Docker Pulls](https://img.shields.io/docker/pulls/hvalev/rawgraphs2.0)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/hvalev/rawgraphs2.0)

[Rawgraphs 2.0](https://github.com/rawgraphs/rawgraphs-app) is a visualization framework for creating beautiful graphics for your data. Please see [the official website](https://app.rawgraphs.io/) for details and examples. As the title says, it's a docker container suitable for self-hosting. At the moment it is still in beta and unfortunately it doesn't seem to work for x32-bit architectures. Perhaps this will be resolved once a stable version is released.

## How to run
You can only run this container on localhost, or from an ssl-enabled hostname. Below is a working docker compose file. After a minute or so you can access the application on http://localhost:3339
```
version: "3"
services:
  rawgraphs:
    image: hvalev/rawgraphs2.0:latest
    container_name: rawgraphs
    ports:
      - 3339:3000
    restart: always
```

## Acknowledgements
[Rawgraphs 2.0](https://github.com/rawgraphs/rawgraphs-app). Please consider supporting this fantastic project.
