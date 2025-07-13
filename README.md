# Custom OpenTelemetry Collector Builder

This repository contains the configuration to build a custom OpenTelemetry Collector distribution.

## Components

The custom collector includes:

- **Receivers**: OTLP
- **Processors**: Batch
- **Exporters**: OTLP, Logging
- **Extensions**: zPages

## Building

To build the collector locally:

```bash
# Install the OpenTelemetry Collector Builder
go install go.opentelemetry.io/collector/cmd/builder@latest

# Build the collector
builder --config=manifest.yaml
```

The binaries will be available in the `./dist` directory.

## GitHub Releases

This repository is configured to automatically build and publish binaries for Linux (amd64 and arm64) to GitHub Releases when a new tag is pushed.