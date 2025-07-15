#!/bin/bash
set -e

export GOROOT='/usr/lib/go-1.23'
export GOTOOLDIR='/usr/lib/go-1.23/pkg/tool/linux_amd64'
export GOVERSION='go1.23.1'
export PATH="/usr/lib/go-1.23/bin:$PATH"

# Install the OpenTelemetry Collector Builder at the specific version
go version
go install go.opentelemetry.io/collector/cmd/builder@v0.129.0

# Build the collector
# Use the full path to the builder binary
$HOME/go/bin/builder --config=manifest.yaml --verbose

echo "Build completed successfully. Binaries are available in the ./dist directory."

ls -lah dist/otelcol