import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';

class ChannelNewData {
  static final Map<int, Map<String, dynamic>> channelNewList = {
    1: {"name": "channelname"}
  };

  static Map<String, dynamic>? getMapById(int channelNewId) {
    return ChannelNewData.channelNewList[channelNewId];
  }

  static ChannelNew getById(int channelId) {
    return ChannelNew.fromMap(ChannelNewData.channelNewList[channelId]);
  }

  static List<ChannelNew> getChannelNewList() {
    return ChannelNewData.channelNewList.values
        .map((e) => ChannelNew.fromMap(e))
        .toList();
  }
}
