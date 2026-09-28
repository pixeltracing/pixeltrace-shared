# pixeltrace.dev communication interface

This repository contains the protobuf definitions of the interfaces used for
communication between major Pixeltrace subsystems.

## Namespaces

Protos are collected by logical scope in the overall architecture. Each
namespace is versioned independently.

### `pixeltrace.coord`: the media coordination layer

The media coordination layer consists of the services responsible for:

- negotiation of media ingestion
- allocating serverside resources necessary to receive media
- routing incoming media to the service that remuxes to persistent storage

### `pixeltrace.data`: the media data layer

### `pixeltrace.mgmt`: the user management layer

### Support / common

These are cross-cutting definitions used from multiple layers.

#### `pixeltrace.types`: common types

#### `pixeltrace.error`: common error types
