/// Flutter SDK for session recording.
library;

export 'src/pixeltrace.dart' show Pixeltrace;

export 'src/internal/config.dart'
    show PixeltraceServiceConfig, PixeltraceCaptureConfig, PixeltraceTransport;

export 'src/internal/errors.dart'
    show
        PixeltraceErrorSink,
        DefaultErrorSink,
        NullErrorSink,
        PixeltraceServiceException,
        PixeltraceCaptureException;
