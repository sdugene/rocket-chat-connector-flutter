import 'dart:convert';

import 'package:rocket_chat_flutter_connector/web_socket/notification_args.dart';

class NotificationFields {
  String? eventName;
  List<NotificationArgs>? args;

  NotificationFields({
    this.eventName,
    this.args,
  });

  NotificationFields.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      eventName = json['eventName'];
      if (json['args'] != null) {
        List<dynamic> jsonList = json['args'].runtimeType == String //
            ? jsonDecode(json['args'])
            : json['args'];
        args = jsonList
            .where((json) => json != null)
            .map((json) => NotificationArgs.fromMap(json))
            .toList();
      } else {
        args = null;
      }
    }
  }

  @override
  String toString() {
    return 'WebSocketMessageFields{eventName: $eventName, args: $args}';
  }
}
