import 'package:rocket_chat_connector_flutter/models/message_response.dart';

class MessageResponseData {
  static final Map<int, Map<String, dynamic>> messageResponseList = {
    1: {
      "ts": 1481748965123,
      "channel": "general",
      "message": {
        "alias": "",
        "msg": "This is a test!",
        "parseUrls": true,
        "groupable": false,
        "ts": "2016-12-14T20:56:05.117Z",
        "u": {
          "_id": "y65tAmHs93aDChMWu",
          "username": "graywolf336"
        },
        "rid": "GENERAL",
        "_updatedAt": "2016-12-14T20:56:05.119Z",
        "_id": "jC9chsFddTvsbFQG7"
      },
      "success": true
    },
  };

  static Map<String, dynamic> getMapById(String messageResponseId) {
    return MessageResponseData.messageResponseList[messageResponseId];
  }

  static MessageResponse getById(int messageResponseId) {
    return MessageResponse.fromMap(MessageResponseData.messageResponseList[messageResponseId]);
  }

  static List<MessageResponse> getMessageList() {
    return MessageResponseData.messageResponseList.values.map((e) => MessageResponse.fromMap(e)).toList();
  }
}
