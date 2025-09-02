FROM golang:1.24.1-alpine AS base

# Combine RUN commands and clean up in same layer to reduce size
RUN apk add --no-cache make build-base curl && \
    go install github.com/air-verse/air@latest && \
    go install github.com/maruel/panicparse@latest && \
    go install github.com/onsi/ginkgo/v2/ginkgo@v2.23.3 && \
    mkdir -p /go/cache/go-build /go/cache/golangci-lint /go/pkg/mod/cache/download && \
    chmod -R 777 /go && \
    find /go -type d -exec chmod 777 {} \; && \
    # Clean up APK cache
    rm -rf /var/cache/apk/* && \
    # Clean up Go cache after installing tools
    go clean -cache -modcache

ENV GOCACHE=/app/.cache/go-build
ENV GOLANGCI_LINT_CACHE=/app/.cache/golangci-lint
ENV GOMODCACHE=/app/.cache/go-mod
ENV GOFLAGS="-buildvcs=false"
ARG APP_ROOT=/app
ENV APP_ROOT=${APP_ROOT}
ENV CGO_ENABLED="1"

WORKDIR ${APP_ROOT}

# Fix permissions in one layer
RUN mkdir -p ${GOCACHE} ${GOLANGCI_LINT_CACHE} && \
    chmod -R 777 /go/cache

FROM golangci/golangci-lint:v1.64.6-alpine AS lint-base

# Final base image with linter
FROM base AS final-base
COPY --from=lint-base /usr/bin/golangci-lint /usr/bin/golangci-lint

# Service-specific image
FROM final-base AS service
ARG SERVICE_DIR=""
WORKDIR /app/${SERVICE_DIR}

# Test base image - adds test dependencies
FROM service AS test_base
# Add any test-specific dependencies here
ENV APP_ENV=test