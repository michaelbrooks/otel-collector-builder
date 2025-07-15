dist:
  name: otelcol
  description: Custom OTel Collector for Raspberry Pi
  output_path: ./dist
  version: ${VERSION}

exporters:
  - gomod: go.opentelemetry.io/collector/exporter/debugexporter v0.129.0
  - gomod: go.opentelemetry.io/collector/exporter/otlpexporter v0.129.0

processors:
  - gomod: go.opentelemetry.io/collector/processor/batchprocessor v0.129.0
  - gomod: go.opentelemetry.io/collector/processor/memorylimiterprocessor v0.129.0
  - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/processor/resourceprocessor v0.129.0 # 1MB
  - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/processor/transformprocessor v0.129.0 # 11MB

receivers:
  - gomod: go.opentelemetry.io/collector/receiver/otlpreceiver v0.129.0
  - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/receiver/hostmetricsreceiver v0.129.0 # 1MB
  # - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/receiver/prometheusreceiver v0.129.0 # 79MB
  - gomod: github.com/open-telemetry/opentelemetry-collector-contrib/receiver/journaldreceiver v0.129.0 # 2MB

providers:
  - gomod: go.opentelemetry.io/collector/confmap/provider/envprovider v1.18.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/fileprovider v1.18.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/httpprovider v1.18.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/httpsprovider v1.18.0
  - gomod: go.opentelemetry.io/collector/confmap/provider/yamlprovider v1.18.0