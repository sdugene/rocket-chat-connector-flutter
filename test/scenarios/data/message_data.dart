import 'package:rocket_chat_connector_flutter/models/message.dart';

class MessageData {
  static final Map<String, Map<String, dynamic>> messageList = {
    "7aDSXtjMA3KPLxLjt": {
      "_id": "7aDSXtjMA3KPLxLjt",
      "rid": "GENERAL",
      "msg": "This is a test!",
      "ts": "2016-12-14T20:56:05.117Z",
      "u": {
        "_id": "y65tAmHs93aDChMWu",
        "username": "graywolf336"
      }
    }
  };

  static Map<String, dynamic> getMapById(String messageId) {
    return MessageData.messageList[messageId];
  }

  static Message getById(String messageId) {
    return Message.fromMap(MessageData.messageList[messageId]);
  }

  static List<Message> getMessageList() {
    return MessageData.messageList.values.map((e) => Message.fromMap(e)).toList();
  }
}
