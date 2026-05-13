FROM node:18-alpine AS deps
WORKDIR /app

FROM python:3.11 AS analyzer

FROM golang:1.21 AS builder

FROM nginx:latest AS web
EXPOSE 80

FROM cgr.dev/chainguard/wolfi-base:latest

FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
      curl nodejs python3 bazel kubectl helm \
    && rm -rf /var/lib/apt/lists/*
RUN apk add --no-cache terraform redis foo-not-managed
