FROM ghcr.io/cirruslabs/flutter:3.41.6

ARG NODE_MAJOR=22
ARG GO_VERSION=1.26.4
ARG BUF_VERSION=1.71.0
ARG PROTOC_GEN_GO_VERSION=v1.36.11

RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo ca-certificates curl gnupg git \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu

# Node.js + pnpm
RUN curl -fsSL "https://deb.nodesource.com/setup_${NODE_MAJOR}.x" | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && corepack enable \
    && corepack prepare pnpm@11.9.0 --activate

# Go toolchain
RUN ARCH="$(dpkg --print-architecture)" \
    && curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-${ARCH}.tar.gz" \
        | tar -C /usr/local -xz
ENV PATH="/usr/local/go/bin:/home/ubuntu/go/bin:${PATH}"
ENV GOPATH="/home/ubuntu/go"

# Protobuf tooling: buf CLI + the protoc-gen-go plugin buf invokes.
RUN ARCH="$(uname -m)" \
    && curl -fsSL "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-$(uname -s)-${ARCH}" \
        -o /usr/local/bin/buf \
    && chmod +x /usr/local/bin/buf

RUN chown -R ubuntu:ubuntu /sdks/flutter && \
    git config --global --add safe.directory /sdks/flutter

USER ubuntu

# protoc-gen-go into the user GOPATH/bin, so `buf generate` in
# packages/go/schema can find the plugin.
RUN go install "google.golang.org/protobuf/cmd/protoc-gen-go@${PROTOC_GEN_GO_VERSION}"
