# Simple build image for local development
FROM golang:1.24

ARG OTEL_BUILDER_VERSION
ARG UID=1000
ARG GID=1000

# Create a non-root user with the same UID/GID as the host user
RUN groupadd -g ${GID} builder && \
    useradd -u ${UID} -g ${GID} -m -s /bin/bash builder

COPY scripts/install_build_deps.sh /
RUN chown builder:builder /install_build_deps.sh

# Install dependencies as the builder user
USER builder
RUN bash /install_build_deps.sh

# Prefetch a bunch of stuff
RUN builder
