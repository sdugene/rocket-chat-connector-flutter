import 'package:rocket_chat_connector_flutter/models/message.dart';

class MessageNewResponse {
  int? ts;
  String? channel;
  Message? message;
  bool? success;

  MessageNewResponse({
    this.ts,
    this.channel,
    this.message,
    this.success = false,
  });

  MessageNewResponse.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      ts = json['ts'];
      channel = json['channel'];
      message =
          json['message'] != null ? Message.fromMap(json['message']) : null;
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
        'ts': ts,
        'channel': channel,
        'message': message != null ? message!.toMap() : null,
        'success': success,
      };

  @override
  String toString() {
    return 'MessageResponse{ts: $ts, channel: $channel, message: $message, success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageNewResponse &&
          runtimeType == other.runtimeType &&
          ts == other.ts &&
          channel == other.channel &&
          message == other.message &&
          success == other.success;

  @override
  int get hashCode =>
      ts.hashCode ^ channel.hashCode ^ message.hashCode ^ success.hashCode;
}
