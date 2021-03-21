import 'package:collection/collection.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';

class Channel {
  String? id;
  String? name;
  String? t;
  List<String>? usernames;
  int? msgs;
  User? user;
  DateTime? ts;

  Channel({
    this.id,
    this.name,
    this.t,
    this.usernames,
    this.msgs,
    this.user,
    this.ts,
  });

  Channel.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'];
      name = json['name'];
      t = json['t'];
      usernames = List<String>.from(json['usernames']);
      msgs = json['msgs'];
      user = json['u'] != null ? User.fromMap(json['u']) : null;
      ts = DateTime.parse(json['ts']);
    }
  }

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        't': t,
        'usernames': usernames,
        'msgs': msgs,
        'u': user != null ? user!.toMap() : null,
        'ts': ts != null ? ts!.toIso8601String() : null,
      };

  @override
  String toString() {
    return 'Channel{_id: $id, name: $name, t: $t, usernames: $usernames, msgs: $msgs, user: $user, ts: $ts}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Channel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          t == other.t &&
          DeepCollectionEquality().equals(usernames, other.usernames) &&
          msgs == other.msgs &&
          user == other.user &&
          ts == other.ts;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      t.hashCode ^
      usernames.hashCode ^
      msgs.hashCode ^
      user.hashCode ^
      ts.hashCode;
}
