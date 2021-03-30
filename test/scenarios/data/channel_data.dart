import 'package:rocket_chat_connector_flutter/models/channel.dart';

class ChannelData {
  static final Map<String, Map<String, dynamic>> channelList = {
    "ByehQjC44FwMeiLbX": {
      "_id": "ByehQjC44FwMeiLbX",
      "name": "channelname",
      "t": "c",
      "usernames": ["example"],
      "msgs": 0,
      "u": {"_id": "aobEdbYhXfu5hkeqG", "username": "example"},
      "ts": "2016-05-30T13:42:25.304Z"
    }
  };

  static Map<String, dynamic>? getMapById(String channelId) {
    return ChannelData.channelList[channelId];
  }

  static Channel getById(String channelId) {
    return Channel.fromMap(ChannelData.channelList[channelId]);
  }

  static List<Channel> getChannelList() {
    return ChannelData.channelList.values
        .map((e) => Channel.fromMap(e))
        .toList();
  }
}
