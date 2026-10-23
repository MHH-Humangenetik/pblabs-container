# syntax=docker/dockerfile:1
ARG PBLAB_VERSION=20261021

FROM alpine:3.22 AS download
ARG PBLAB_VERSION
ADD https://github.com/PacificBiosciences/pblab/releases/download/${PBLAB_VERSION}/pblab-${PBLAB_VERSION}-linux-x86_64.tar.xz /tmp/pblab.tar.xz
RUN mkdir /pblab \
    && tar -xJf /tmp/pblab.tar.xz -C /pblab --strip-components=1 \
    && cd /pblab/bin \
    && sha256sum -c ../SHA256SUMS

FROM gcr.io/distroless/cc-debian12 AS slim

COPY --from=download /pblab/bin/ /usr/local/bin/
COPY --from=download /pblab/LICENSE /usr/share/doc/pblab/LICENSE

FROM debian:12-slim AS nextflow

COPY --from=download /pblab/bin/ /usr/local/bin/
COPY --from=download /pblab/LICENSE /usr/share/doc/pblab/LICENSE

# install ps (https://nextflow.io/docs/latest/reports.html#execution-report-tasks), the other tools ship with debian-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends procps \
    && rm -rf /var/lib/apt/lists/*
