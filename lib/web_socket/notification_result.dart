import 'package:rocket_chat_connector_flutter/web_socket/notification_user.dart';

class NotificationResult {
  String? id;
  String? token;
  DateTime? tokenExpires;
  String? type;
  String? rid;
  String? msg;
  DateTime? ts;
  NotificationUser? user;
  DateTime? updatedAt;
  List<String>? mentions;
  List<String>? channels;

  NotificationResult({
    this.id,
    this.token,
    this.tokenExpires,
    this.type,
    this.rid,
    this.msg,
    this.ts,
    this.user,
    this.updatedAt,
    this.mentions,
    this.channels,
  });

  NotificationResult.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] != null ? json['_id'] : json['id'];
      token = json['token'];
      tokenExpires = json['tokenExpires'] != null &&
              json['tokenExpires']['\$date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['tokenExpires']['\$date'])
          : DateTime.now();
      type = json['type'];
      rid = json['rid'];
      msg = json['msg'];
      ts = json['ts'] != null && json['ts']['\$date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['ts']['\$date'])
          : DateTime.now();
      user = json['u'] != null ? NotificationUser.fromMap(json['u']) : null;
      updatedAt = json['_updatedAt'] != null &&
              json['_updatedAt']['\$date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['_updatedAt']['\$date'])
          : DateTime.now();
      mentions =
          json['mentions'] != null ? List<String>.from(json['mentions']) : null;
      channels =
          json['channels'] != null ? List<String>.from(json['channels']) : null;
    }
  }

  @override
  String toString() {
    return 'NotificationResult{id: $id, token: $token, tokenExpires: $tokenExpires, type: $type, rid: $rid, msg: $msg, ts: $ts, user: $user, updatedAt: $updatedAt, mentions: $mentions, channels: $channels}';
  }
}
