import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';

class MessageNewResponseData {
  static final Map<int, Map<String, dynamic>> messageNewResponseList = {
    1: {
      "ts": 1481748965123,
      "channel": "general",
      "message": {
        "alias": "",
        "msg": "This is a test!",
        "parseUrls": true,
        "groupable": false,
        "ts": "2016-12-14T20:56:05.117Z",
        "u": {"_id": "y65tAmHs93aDChMWu", "username": "graywolf336"},
        "rid": "GENERAL",
        "_updatedAt": "2016-12-14T20:56:05.119Z",
        "_id": "jC9chsFddTvsbFQG7"
      },
      "success": true
    },
  };

  static Map<String, dynamic>? getMapById(int messageNewResponseId) {
    return MessageNewResponseData.messageNewResponseList[messageNewResponseId];
  }

  static MessageNewResponse getById(int messageNewResponseId) {
    return MessageNewResponse.fromMap(
        MessageNewResponseData.messageNewResponseList[messageNewResponseId]);
  }

  static List<MessageNewResponse> getMessageList() {
    return MessageNewResponseData.messageNewResponseList.values
        .map((e) => MessageNewResponse.fromMap(e))
        .toList();
  }
}
