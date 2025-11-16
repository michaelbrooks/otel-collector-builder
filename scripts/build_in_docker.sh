#!/bin/bash
set -e

# Build script for local development with Docker
# Sources versions.env for centralized version management

source versions.env

# Allow overriding BUILD_VERSION
export VERSION=${BUILD_VERSION}

echo "Building with versions from versions.env:"
echo "  OTEL_BUILDER_VERSION: $OTEL_BUILDER_VERSION"
echo "  OTEL_PACKAGE_VERSION: $OTEL_PACKAGE_VERSION"
echo "  BUILD_VERSION: $VERSION"
echo ""

docker build \
  --build-arg OTEL_BUILDER_VERSION=${OTEL_BUILDER_VERSION} \
  --build-arg UID=$(id -u) \
  --build-arg GID=$(id -g) \
  -t otel-collector-builder:latest .

# Run container as builder user (same UID as host) - no permission issues with dist/ files
docker run \
  -e VERSION=${VERSION} \
  -e OTEL_PACKAGE_VERSION=${OTEL_PACKAGE_VERSION} \
  -e OTEL_BUILDER_VERSION=${OTEL_BUILDER_VERSION} \
  --volume $(pwd):/build \
  --workdir /build \
  otel-collector-builder:latest \
  bash scripts/build.sh