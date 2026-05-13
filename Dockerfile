FROM node:18-alpine AS deps
WORKDIR /app

FROM python:3.11 AS analyzer

FROM golang:1.21 AS builder

FROM nginx:latest AS web
EXPOSE 80

FROM cgr.dev/chainguard/wolfi-base:latest

FROM cgr.dev/chainguard/wolfi-base:latest AS tools
RUN apk add --no-cache \
      bazel kubectl helm terraform \
      curl jq foo-not-managed

