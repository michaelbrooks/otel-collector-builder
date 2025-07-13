FROM alpine:3.19

ARG TARGETARCH
ARG VERSION

# Copy the binary with version in the filename
COPY dist/${TARGETARCH}/otelcol-custom-${VERSION}-linux-${TARGETARCH} /otelcol-custom
COPY config.yaml /etc/otelcol-custom/config.yaml

RUN chmod +x /otelcol-custom && \
    apk --no-cache add ca-certificates

EXPOSE 4317 4318 55679
ENTRYPOINT ["/otelcol-custom"]
CMD ["--config", "/etc/otelcol-custom/config.yaml"]