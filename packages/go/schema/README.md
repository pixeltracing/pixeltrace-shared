# Pixeltrace Go schema

Go definitions for the Pixeltrace protobuf schema.

Homepage: [pixeltrace.dev](https://pixeltrace.dev/)

These bindings are generated from the canonical `.proto` definitions in
[`/proto`](../../../proto) using [protoc-gen-go](https://pkg.go.dev/google.golang.org/protobuf).

Module path: `github.com/pixeltracing/pixeltrace-shared/packages/go/schema`.
Generated packages live under `gen/pixeltrace/...`.

## Usage

```go
import (
    "google.golang.org/protobuf/proto"

    coordv1 "github.com/pixeltracing/pixeltrace-shared/packages/go/schema/gen/pixeltrace/coord/v1"
)

var req coordv1.EstablishRequest
_ = proto.Unmarshal(body, &req)
```

## Development

The generated sources (`gen/`) are not committed; regenerate them from the
proto source. Requires `buf` and the `protoc-gen-go` plugin on PATH:

```sh
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
./generate.sh   # buf generate + go mod tidy
```
