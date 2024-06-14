#### base ####
FROM node:18.3.0-slim as node
FROM ubuntu:focal-20220531 as base

RUN apt-get update \
  && apt-get -qq install -y --no-install-recommends \
  tini \
  && rm -rf /var/lib/apt/lists/*

#### prod-server ####
FROM base as prod-server
# COPY --chown=node:node . .
ENTRYPOINT ["/usr/bin/tini", "--"]