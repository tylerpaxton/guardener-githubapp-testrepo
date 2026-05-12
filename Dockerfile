FROM cgr.dev/chainguard/node:latest-dev AS deps  # was: node:18-alpine
WORKDIR /app

FROM cgr.dev/chainguard/python:latest-dev AS analyzer  # was: python:3.11

FROM cgr.dev/chainguard/go:latest-dev AS builder  # was: golang:1.21

FROM cgr.dev/chainguard/nginx:latest-dev AS web  # was: nginx:latest
EXPOSE 80

FROM cgr.dev/chainguard/wolfi-base:latest

FROM cgr.dev/chainguard/rust:latest-dev AS rust  # was: rust:1.79
