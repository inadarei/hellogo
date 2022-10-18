#!/usr/bin/env sh

set -e

go mod init ika.ge/helloweb && go mod tidy

# see: https://go.dev/doc/install/source#environment
for GOOS in linux; do
  for GOARCH in amd64 arm64; do
    export GOOS GOARCH
    CGO_ENABLED=0 go build -ldflags "-s -w -extldflags '-static'" -buildvcs=false -v -o $GOOS/$GOARCH/helloweb
  done
done
