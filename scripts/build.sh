#!/bin/bash
set -e

# Main build script - runs inside Docker container
# Expects VERSION and OTEL_PACKAGE_VERSION to be set by build_in_docker.sh

VERSION=${VERSION:?Error: VERSION must be set}
OTEL_PACKAGE_VERSION=${OTEL_PACKAGE_VERSION:?Error: OTEL_PACKAGE_VERSION must be set}

echo "Building package version ${VERSION} from OTEL ${OTEL_PACKAGE_VERSION}"

# Avoid issues with docker mounting git directory as the wrong user
git config --global --add safe.directory $(pwd)

# Generate manifest.yaml from template with variable substitution
echo "Generating manifest.yaml from template..."
envsubst < manifest.yaml.tpl > manifest.yaml
echo ""
echo "Generated manifest.yaml:"
cat manifest.yaml
echo ""

# Define architectures to build
ARCHITECTURES=("amd64" "arm64")

rm -rf dist

for ARCH in "${ARCHITECTURES[@]}"; do
  echo ""
  echo "Building for architecture: $ARCH"
  export GOARCH=$ARCH

  # Build the collector
  builder --config=manifest.yaml --verbose

  # Move the binary to dist directory with version and architecture
  if [ -f dist/otelcol ]; then
    mkdir -p "dist/${ARCH}"
    mv dist/otelcol "dist/${ARCH}/otelcol-${VERSION}-linux-${ARCH}"
    echo "✓ Built: dist/${ARCH}/otelcol-${VERSION}-linux-${ARCH}"
  fi
done

echo ""
echo "Build completed successfully. Binaries are available in the ./dist directory:"
ls -lah dist/*/*