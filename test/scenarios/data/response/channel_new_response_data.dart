import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';

class ChannelNewResponseData {
  static final Map<int, Map<String, dynamic>> channelNewResponseList = {
    1: {
      "channel": {
        "_id": "ByehQjC44FwMeiLbX",
        "name": "channelname",
        "t": "c",
        "usernames": ["example"],
        "msgs": 0,
        "u": {"_id": "aobEdbYhXfu5hkeqG", "username": "example"},
        "ts": "2016-05-30T13:42:25.304Z"
      },
      "success": true
    },
  };

  static Map<String, dynamic>? getMapById(int channelNewResponseId) {
    return ChannelNewResponseData.channelNewResponseList[channelNewResponseId];
  }

  static ChannelNewResponse getById(int channelNewResponseId) {
    return ChannelNewResponse.fromMap(
        ChannelNewResponseData.channelNewResponseList[channelNewResponseId]);
  }

  static List<ChannelNewResponse> getMessageList() {
    return ChannelNewResponseData.channelNewResponseList.values
        .map((e) => ChannelNewResponse.fromMap(e))
        .toList();
  }
}
