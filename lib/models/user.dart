import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rocket_chat_connector_flutter/models/email.dart';
import 'package:rocket_chat_connector_flutter/models/preferences.dart';

class User {
  String _id;
  String name;
  List<Email> emails;
  String status;
  String statusConnection;
  String username;
  int utcOffset;
  bool active;
  List<String> roles;
  Map<String, Preferences> settings;
  String avatarUrl;
  Map<String, String> customFields;
  bool success;

  User.name({
    this.name,
    this.emails,
    this.status,
    this.statusConnection,
    this.username,
    this.utcOffset,
    this.active,
    this.roles,
    this.settings,
    this.avatarUrl,
    this.customFields,
    this.success,
  });

  User.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      _id = json['_id'];
      name = json['name'];

      if (json['emails'] != null) {
        List<dynamic> jsonList = json['emails'].runtimeType == String //
            ? jsonDecode(json['emails'])
            : json['emails'];
        emails = jsonList.where((json) => json != null).map((json) => Email.fromMap(json)).toList();
      } else {
        emails = [];
      }

      status = json['status'];
      statusConnection = json['statusConnection'];
      username = json['username'];
      utcOffset = json['utcOffset'];
      active = json['active'];

      if (json['roles'] != null) {
        List<dynamic> jsonList = json['roles'].runtimeType == String //
            ? jsonDecode(json['roles'])
            : json['roles'];
        roles = jsonList.where((json) => json != null).map((value) => value.toString()).toList();
      } else {
        roles = [];
      }

      if (json['settings'] != null) {
        Map<String, dynamic> jsonSettings = json['settings'].runtimeType == String //
            ? jsonDecode(json['settings'])
            : json['settings'];

        if (jsonSettings['preferences'] != null) {
          settings = {'preferences': Preferences.fromMap(jsonSettings['preferences'])};
        }
      }

      avatarUrl = json['avatarUrl'];
      if (json['customFields'] != null) {
        customFields = Map<String, String>.from(json['customFields']);
      }
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
        '_id': _id,
        'name': name,
        'emails': emails?.where((json) => json != null)?.map((email) => email.toMap())?.toList() ?? [],
        'status': status,
        'statusConnection': statusConnection,
        'username': username,
        'utcOffset': utcOffset,
        'active': active,
        'roles': roles?.where((json) => json != null)?.toList() ?? [],
        'settings': settings != null ? (settings['preferences'] != null ? {'preferences': settings['preferences'].toMap()} : {'preferences': {}}) : null,
        'avatarUrl': avatarUrl,
        'customFields': customFields,
        'success': success,
      };

  @override
  String toString() {
    return 'User{_id: $_id, name: $name, emails: $emails, status: $status, statusConnection: $statusConnection, username: $username, utcOffset: $utcOffset, active: $active, roles: $roles, settings: $settings, avatarUrl: $avatarUrl, customFields: $customFields, success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              _id == other._id &&
              name == other.name &&
              DeepCollectionEquality().equals(emails, other.emails) &&
              status == other.status &&
              statusConnection == other.statusConnection &&
              username == other.username &&
              utcOffset == other.utcOffset &&
              active == other.active &&
              DeepCollectionEquality().equals(roles, other.roles) &&
              DeepCollectionEquality().equals(settings, other.settings) &&
              avatarUrl == other.avatarUrl &&
              DeepCollectionEquality().equals(customFields, other.customFields) &&
              success == other.success;

  @override
  int get hashCode =>
      _id.hashCode ^
      name.hashCode ^
      emails.hashCode ^
      status.hashCode ^
      statusConnection.hashCode ^
      username.hashCode ^
      utcOffset.hashCode ^
      active.hashCode ^
      roles.hashCode ^
      settings.hashCode ^
      avatarUrl.hashCode ^
      customFields.hashCode ^
      success.hashCode;
}
