import 'package:rocket_chat_connector_flutter/models/user.dart';

class MessageResponse {
  int ts;
  String channel;
  _Message message;
  bool success;

  MessageResponse({
    this.ts,
    this.channel,
    this.message,
  });

  MessageResponse.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      ts = json['ts'];
      channel = json['channel'];
      message = json['message'] != null ? _Message.fromMap(json['message']) : null;
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
        'ts': ts,
        'channel': channel,
        'message': message != null ? message.toMap() : null,
        'success': success,
      };

  @override
  String toString() {
    return 'MessageResponse{ts: $ts, channel: $channel, message: $message, success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MessageResponse &&
              runtimeType == other.runtimeType &&
              ts == other.ts &&
              channel == other.channel &&
              message == other.message &&
              success == other.success;

  @override
  int get hashCode =>
      ts.hashCode ^
      channel.hashCode ^
      message.hashCode ^
      success.hashCode;
}

class _Message {
  String alias;
  String msg;
  bool parseUrls;
  bool groupable;
  DateTime ts;
  User user;
  String rid;
  DateTime _updatedAt;
  String _id;

  _Message.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      alias = json['alias'];
      msg = json['msg'];
      parseUrls = json['parseUrls'];
      groupable = json['groupable'];
      ts = DateTime.parse(json['ts']);
      user = json['u'] != null ? User.fromMap(json['u']) : null;
      rid = json['rid'];
      _updatedAt = DateTime.parse(json['_updatedAt']);
      _id = json['_id'];
    }
  }

  Map<String, dynamic> toMap() => {
        'alias': alias,
        'msg': msg,
        'parseUrls': parseUrls,
        'groupable': groupable,
        'ts': ts != null ? ts.toIso8601String() : null,
        'u': user != null ? user.toMap() : null,
        'rid': rid,
        '_updatedAt': _updatedAt != null ? _updatedAt.toIso8601String() : null,
        '_id': _id,
      };

  @override
  String toString() {
    return '_Message{alias: $alias, msg: $msg, parseUrls: $parseUrls, groupable: $groupable, ts: $ts, user: $user, rid: $rid, _updatedAt: $_updatedAt, _id: $_id}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _Message &&
              runtimeType == other.runtimeType &&
              alias == other.alias &&
              msg == other.msg &&
              parseUrls == other.parseUrls &&
              groupable == other.groupable &&
              ts == other.ts &&
              user == other.user &&
              rid == other.rid &&
              _updatedAt == other._updatedAt &&
              _id == other._id;

  @override
  int get hashCode =>
      alias.hashCode ^
      msg.hashCode ^
      parseUrls.hashCode ^
      groupable.hashCode ^
      ts.hashCode ^
      user.hashCode ^
      rid.hashCode ^
      _updatedAt.hashCode ^
      _id.hashCode;
}
