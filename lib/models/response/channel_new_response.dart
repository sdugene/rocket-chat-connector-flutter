import 'package:rocket_chat_connector_flutter/models/channel.dart';

class ChannelNewResponse {
  Channel? channel;
  bool? success;

  ChannelNewResponse({
    this.channel,
    this.success = false,
  });

  ChannelNewResponse.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      channel =
          json['channel'] != null ? Channel.fromMap(json['channel']) : null;
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
        'channel': channel != null ? channel!.toMap() : null,
        'success': success,
      };

  @override
  String toString() {
    return 'MessageResponse{channel: $channel, success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelNewResponse &&
          runtimeType == other.runtimeType &&
          channel == other.channel &&
          success == other.success;

  @override
  int get hashCode => channel.hashCode ^ success.hashCode;
}
