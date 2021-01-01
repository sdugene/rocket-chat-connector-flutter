class RocketChatException implements Exception {
  String message;
  RocketChatException(this.message);

  String toString() {
    if (message == null) return "RocketChatException";
    return "RocketChatException: $message";
  }
}
