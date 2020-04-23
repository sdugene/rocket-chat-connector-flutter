import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/filters/filter.dart';

class ChannelFilter extends Filter {
  Channel channel;

  ChannelFilter(this.channel);

  Map<String, dynamic> toMap() => {
        'roomId': channel.id,
      };

  @override
  String toString() {
    return 'ChannelFilter{channel: $channel}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelFilter &&
          runtimeType == other.runtimeType &&
          channel == other.channel;

  @override
  int get hashCode => channel.hashCode;
}
