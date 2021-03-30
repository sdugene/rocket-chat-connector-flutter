import 'package:rocket_chat_connector_flutter/web_socket/notification_payload.dart';

class NotificationArgs {
  String? title;
  String? text;
  DateTime? ts;
  NotificationPayload? payload;

  NotificationArgs({
    this.title,
    this.text,
    this.payload,
  });

  NotificationArgs.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      title = json['title'];
      text = json['text'];
      ts = DateTime.now();
      payload = json['payload'] != null
          ? NotificationPayload.fromMap(json['payload'])
          : null;
    }
  }

  @override
  String toString() {
    return 'NotificationArgs{title: $title, text: $text, ts: $ts, payload: $payload}';
  }
}
