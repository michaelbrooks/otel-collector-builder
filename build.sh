#!/bin/bash
set -e

# Install the OpenTelemetry Collector Builder at the specific version
go install go.opentelemetry.io/collector/cmd/builder@v0.129.0

# Build the collector
# Use the full path to the builder binary
$HOME/go/bin/builder --config=manifest.yaml

echo "Build completed successfully. Binaries are available in the ./dist directory."