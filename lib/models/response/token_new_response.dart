import 'package:rocket_chat_connector_flutter/models/token.dart';

class TokenNewResponse {
  Token? token;
  bool? success;

  TokenNewResponse({
    this.token,
    this.success = false,
  });

  TokenNewResponse.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      token =
      json['result'] != null ? Token.fromMap(json['result']) : null;
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
    'result': token != null ? token!.toMap() : null,
    'success': success,
  };

  @override
  String toString() {
    return 'TokenNewResponse{token: $token, success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TokenNewResponse &&
              runtimeType == other.runtimeType &&
              token == other.token &&
              success == other.success;

  @override
  int get hashCode => token.hashCode ^ success.hashCode;
}
