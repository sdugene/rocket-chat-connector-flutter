import 'package:rocket_chat_connector_flutter/web_socket/notification_message.dart';
import 'package:rocket_chat_connector_flutter/web_socket/notification_user.dart';

class NotificationPayload {
  String? id;
  String? rid;
  NotificationUser? sender;
  String? type;
  NotificationMessage? message;

  NotificationPayload({
    this.id,
    this.rid,
    this.sender,
    this.type,
    this.message,
  });

  NotificationPayload.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'];
      rid = json['rid'];
      sender = json['sender'] != null
          ? NotificationUser.fromMap(json['sender'])
          : null;
      type = json['type'];
      message = json['message'] != null
          ? NotificationMessage.fromMap(json['message'])
          : null;
    }
  }

  @override
  String toString() {
    return 'NotificationPayload{id: $id, rid: $rid, sender: $sender, type: $type, message: $message}';
  }
}
