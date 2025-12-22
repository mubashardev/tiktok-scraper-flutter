/// A custom exception thrown by the TikTok Scraper.
class TikTokException implements Exception {
  /// The error message.
  final String message;

  /// Creates a [TikTokException] with the provided [message].
  TikTokException(this.message);

  @override
  String toString() => 'TikTokException: $message';
}
