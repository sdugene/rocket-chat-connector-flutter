class LoginException implements Exception {
  String message;
  LoginException(this.message);

  String toString() {
    if (message == null) return "LoginException";
    return "LoginException: $message";
  }
}
