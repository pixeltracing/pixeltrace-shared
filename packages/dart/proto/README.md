# pixeltrace_proto

Generated Dart protobuf bindings and [Connect](https://connectrpc.com) clients
for the Pixeltrace API.

## Regenerating

Requires the [`buf`](https://buf.build) CLI and the Dart SDK on your `PATH`:

```sh
./generate.sh
```

This regenerates `lib/google` and `lib/pixeltrace` contents from the
repository's top-level `proto/` directory.
