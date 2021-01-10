import 'package:rocket_chat_connector_flutter/web_socket/notification_payload.dart';

class NotificationArgs {
  String title;
  String text;
  NotificationPayload payload;

  NotificationArgs({
    this.title,
    this.text,
    this.payload,
  });

  NotificationArgs.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      title = json['title'];
      text = json['text'];
      payload = json['payload'] != null
          ? NotificationPayload.fromMap(json['payload'])
          : null;
    }
  }

  @override
  String toString() {
    return 'WebSocketMessageArgs{title: $title, text: $text, payload: $payload}';
  }
}
