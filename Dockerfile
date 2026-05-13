FROM cgr.dev/chainguard/node:latest-dev@sha256:7f8d896586c18c5b11d974fcaa933c17ad0b5842813b54d42527d39915446417 AS deps  # was: node:18-alpine
WORKDIR /app

FROM cgr.dev/chainguard/python:latest-dev@sha256:11ea36ab984ff8c778fbabbd438fae1de5341b515bfc5f12097e34ae9c398088 AS analyzer  # was: python:3.11

FROM cgr.dev/chainguard/go:latest-dev@sha256:6fa17165405eb83325d57b0e0123e2a8e77727806458620bbb1abb2c258c72fa AS builder  # was: golang:1.21

FROM cgr.dev/chainguard/nginx:latest-dev@sha256:70783b7d84b6c5a6ebfde0042f9262cb6ecb4f753d4c6afe29e50d5b2bff4a82 AS web  # was: nginx:latest
EXPOSE 80

FROM cgr.dev/chainguard/wolfi-base:latest

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:4ac37aff83b3f67e96674ddf86d878f8c2a8f16ef1420b02611600bbe94ea8c9 AS builder  # was: ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends \
      curl nodejs python3 bazel kubectl helm \
    && rm -rf /var/lib/apt/lists/*
RUN apk add --no-cache terraform redis foo-not-managed
