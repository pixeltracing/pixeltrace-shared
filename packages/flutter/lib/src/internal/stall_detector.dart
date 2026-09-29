/// How long a sender may go without sending a frame before we presume the
/// remote has discarded its track.
const kRelayTrackExpiry = Duration(seconds: 25);

/// Tracks a frame count total to detect there has been a period of at least
/// [threshold] with no frames sent.
class StallDetector {
  int? _frames;
  DateTime? _progressAt;

  final Duration threshold;

  StallDetector({this.threshold = kRelayTrackExpiry});

  /// Records the sender's [framesSent] total at time [now].
  void record(int framesSent, DateTime now) {
    if (framesSent != _frames) {
      _frames = framesSent;
      _progressAt = now;
    }
  }

  /// Whether no frames have been sent for at least [threshold] as of [now].
  bool isStalled(DateTime now) {
    final progressAt = _progressAt;
    return progressAt != null && now.difference(progressAt) >= threshold;
  }
}
