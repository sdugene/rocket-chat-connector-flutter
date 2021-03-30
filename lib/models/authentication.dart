import 'package:rocket_chat_connector_flutter/models/user.dart';

class Authentication {
  String? status;
  _Data? data;

  Authentication({this.status, this.data});

  Authentication.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      status = json['status'];
      data = json['data'] != null ? _Data.fromMap(json['data']) : null;
    }
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data != null ? data!.toMap() : null,
      };

  @override
  String toString() {
    return 'Authentication{status: $status}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Authentication &&
          runtimeType == other.runtimeType &&
          status == other.status;

  @override
  int get hashCode => status.hashCode;
}

class _Data {
  String? authToken;
  String? userId;
  User? me;

  _Data({
    this.authToken,
    this.userId,
    this.me,
  });

  _Data.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      authToken = json['authToken'];
      userId = json['userId'];
      me = json['me'] != null ? User.fromMap(json['me']) : null;
    }
  }

  Map<String, dynamic> toMap() => {
        'authToken': authToken,
        'userId': userId,
        'me': me != null ? me!.toMap() : null,
      };

  @override
  String toString() {
    return '_Data{authToken: $authToken, userId: $userId, me: $me}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Data &&
          runtimeType == other.runtimeType &&
          authToken == other.authToken &&
          userId == other.userId &&
          me == other.me;

  @override
  int get hashCode => authToken.hashCode ^ userId.hashCode ^ me.hashCode;
}
