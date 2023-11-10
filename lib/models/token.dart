import 'package:collection/collection.dart';

class Token {
  String? id;
  Map<String, String>? token;
  String? appName;
  String? userId;
  bool? enabled;
  DateTime? createdAt;
  DateTime? updatedAt;

  Token({
    this.id,
    this.token,
    this.appName,
    this.userId,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  Token.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'];
      if (json['token'] != null) {
        token = Map<String, String>.from(json['token']);
      }
      appName = json['appName'];
      userId = json['userId'];
      enabled = json['enabled'];
      createdAt = DateTime.parse(json['createdAt']);
      updatedAt = DateTime.parse(json['updatedAt']);
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (id != null) {
      map['_id'] = id;
    }
    if (token != null) {
      map['token'] = token;
    }
    if (appName != null) {
      map['appName'] = appName;
    }
    if (userId != null) {
      map['userId'] = userId;
    }
    if (enabled != null) {
      map['enabled'] = enabled;
    }
    if (createdAt != null) {
      map['createdAt'] = createdAt!.toIso8601String();
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt!.toIso8601String();
    }

    return map;
  }

  @override
  String toString() {
    return 'Token{_id: $id, token: $token, appName: $appName, userId: $userId, enabled: $enabled, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          DeepCollectionEquality().equals(token, other.token) &&
          appName == other.appName &&
          userId == other.userId &&
          enabled == other.enabled &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      token.hashCode ^
      appName.hashCode ^
      userId.hashCode ^
      enabled.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
