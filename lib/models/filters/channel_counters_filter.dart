import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_filter.dart';

import '../user.dart';

class ChannelCountersFilter extends ChannelFilter {
  User? user;

  ChannelCountersFilter(Channel channel, {this.user}) : super(channel);

  Map<String, dynamic> toMap() => {
        'roomId': channel.id,
        'userId': user != null ? user!.id : null,
      };

  @override
  String toString() {
    return 'ChannelCountersFilter{user: $user}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ChannelCountersFilter &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => super.hashCode ^ user.hashCode;
}
