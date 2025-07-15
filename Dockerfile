FROM alpine:3.22

ARG TARGETARCH
ARG VERSION

# Copy the binary with version in the filename
COPY dist/${TARGETARCH}/otelcol-${VERSION}-linux-${TARGETARCH} /otelcol
COPY config.yaml /etc/otelcol/config.yaml

RUN chmod +x /otelcol && \
    apk --no-cache add ca-certificates

EXPOSE 4317 4318 55679
ENTRYPOINT ["/otelcol"]
CMD ["--config", "/etc/otelcol/config.yaml"]