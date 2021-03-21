import 'package:rocket_chat_connector_flutter/models/channel_counters.dart';

class ChannelCountersData {
  static final Map<int, Map<String, dynamic>> channelCountersList = {
    1: {
      "joined": true,
      "members": 78,
      "unreads": 2,
      "unreadsFrom": "2018-02-23T17:15:51.907Z",
      "msgs": 304,
      "latest": "2018-02-23T17:17:03.110Z",
      "userMentions": 0,
      "success": true
    }
  };

  static Map<String, dynamic>? getMapById(int channelCountersId) {
    return ChannelCountersData.channelCountersList[channelCountersId];
  }

  static ChannelCounters getById(int channelCountersId) {
    return ChannelCounters.fromMap(
        ChannelCountersData.channelCountersList[channelCountersId]);
  }

  static List<ChannelCounters> getChannelCountersList() {
    return ChannelCountersData.channelCountersList.values
        .map((e) => ChannelCounters.fromMap(e))
        .toList();
  }
}
