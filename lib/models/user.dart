import 'dart:convert';

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
        roles = jsonList.where((json) => json != null).toList();
      }



      if (json['settings'] != null) {
        Map<String, Map<dynamic, dynamic>> jsonSettings = json['settings'].runtimeType == String //
            ? jsonDecode(json['settings'])
            : json['settings'];

        if (jsonSettings['preferences'] != null) {
          settings = {'preferences': Preferences.fromMap(jsonSettings['preferences'])};
        }
      }

      avatarUrl = json['avatarUrl'];
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
        'settings': settings['preferences'] != null ? {'preferences': settings['preferences'].toMap()} : {'preferences': {}},
        'avatarUrl': avatarUrl,
      };

  @override
  String toString() {
    return 'User{_id: $_id, name: $name, emails: $emails, status: $status, statusConnection: $statusConnection, username: $username, utcOffset: $utcOffset, active: $active, roles: $roles, settings: $settings, avatarUrl: $avatarUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          name == other.name &&
          emails == other.emails &&
          status == other.status &&
          statusConnection == other.statusConnection &&
          username == other.username &&
          utcOffset == other.utcOffset &&
          active == other.active &&
          roles == other.roles &&
          settings == other.settings &&
          avatarUrl == other.avatarUrl;

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
      avatarUrl.hashCode;
}
