#!/bin/bash
set -e

# Install build dependencies
# OTEL_BUILDER_VERSION should be set by the caller (build_in_docker.sh or CI/CD)

OTEL_BUILDER_VERSION=${OTEL_BUILDER_VERSION:?Error: OTEL_BUILDER_VERSION must be set}

echo "Installing build dependencies..."
echo "  OTEL_BUILDER_VERSION: $OTEL_BUILDER_VERSION"

go install github.com/a8m/envsubst/cmd/envsubst@v1.4.3
go install go.opentelemetry.io/collector/cmd/builder@${OTEL_BUILDER_VERSION}
