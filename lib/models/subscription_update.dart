import 'dart:convert';

import 'package:rocket_chat_connector_flutter/models/user.dart';

class SubscriptionUpdate {
  String? id;
  bool? open;
  bool? alert;
  int? unread;
  int? userMentions;
  int? groupMentions;
  DateTime? ts;
  String? rid;
  String? name;
  String? fName;
  String? t;
  User? u;
  DateTime? ls;
  DateTime? updatedAt;
  List<String>? roles;

  SubscriptionUpdate({
    this.id,
    this.open,
    this.alert,
    this.unread,
    this.userMentions,
    this.groupMentions,
    this.ts,
    this.rid,
    this.name,
    this.fName,
    this.t,
    this.u,
    this.ls,
    this.updatedAt,
    this.roles,
  });

  SubscriptionUpdate.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      id = json['_id'];
      open = json['open'];
      alert = json['alert'];
      unread = json['unread'];
      userMentions = json['userMentions'];
      groupMentions = json['groupMentions'];
      ts = json['ts'] != null ? DateTime.parse(json['ts']) : null;
      rid = json['rid'];
      name = json['name'];
      fName = json['fName'];
      t = json['t'];
      u = json['u'] != null ? User.fromMap(json['u']) : null;
      ls = json['ls'] != null ? DateTime.parse(json['ls']) : null;
      updatedAt = json['_updatedAt'] != null
          ? DateTime.parse(json['_updatedAt'])
          : null;
      if (json['roles'] != null) {
        List<dynamic> jsonList = json['roles'].runtimeType == String //
            ? jsonDecode(json['roles'])
            : json['roles'];
        roles = jsonList
            .where((json) => json != null)
            .map((value) => value.toString())
            .toList();
      } else {
        roles = null;
      }
    }
  }

  @override
  String toString() {
    return 'SubscriptionUpdate{id: $id, open: $open, alert: $alert, unread: $unread, userMentions: $userMentions, groupMentions: $groupMentions, ts: $ts, rid: $rid, name: $name, fName: $fName, t: $t, u: $u, ls: $ls, updatedAt: $updatedAt, roles: $roles}';
  }
}
