dist:
  name: otelcol
  description: Custom OTel Collector for Raspberry Pi
  output_path: ./dist
  version: ${VERSION}

exporters:
  - gomod: go.opentelemetry.io/collector/exporter/debugexporter ${OTEL_PACKAGE_VERSION}
  - gomod: go.opentelemetry.io/collector/exporter/otlpexporter ${OTEL_PACKAGE_VERSION}

processors:
  - gomod: go.opentelemetry.io/collector/processor/batchprocessor ${OTEL_PACKAGE_VERSION}
  - gomod: go.opentelemetry.io/collector/processor/memorylimiterprocessor ${OTEL_PACKAGE_VERSION}
  - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/processor/resourceprocessor ${OTEL_PACKAGE_VERSION} # 1MB
  # - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/processor/transformprocessor ${OTEL_PACKAGE_VERSION} # 11MB

receivers:
  - gomod: go.opentelemetry.io/collector/receiver/otlpreceiver ${OTEL_PACKAGE_VERSION}
  - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/receiver/hostmetricsreceiver ${OTEL_PACKAGE_VERSION} # 1MB
  # - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/receiver/prometheusreceiver ${OTEL_PACKAGE_VERSION} # 79MB
  # - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/receiver/journaldreceiver ${OTEL_PACKAGE_VERSION} # 2MB

providers:
  - gomod: go.opentelemetry.io/collector/confmap/provider/envprovider v1.45.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/fileprovider v1.45.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/httpprovider v1.45.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/httpsprovider v1.45.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/yamlprovider v1.45.0
  