import 'package:rocket_chat_flutter_connector/web_socket/notification_payload.dart';

class NotificationArgs {
  String? title;
  String? text;
  String? msg;
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
      msg = json['msg'];
      ts = DateTime.now();
      payload = json['payload'] != null
          ? NotificationPayload.fromMap(json['payload'])
          : null;
    }
  }

  @override
  String toString() {
    return 'NotificationArgs{title: $title, text: $text, msg: $msg, ts: $ts, payload: $payload}';
  }
}
