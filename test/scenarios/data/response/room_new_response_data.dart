import 'package:rocket_chat_connector_flutter/models/response/room_new_response.dart';

class RoomNewResponseData {
  static final Map<int, Map<String, dynamic>> roomNewResponseList = {
    1: {
      "room": {
        "t": "d",
        "rid": "PMrDaS4axRqkjY7errocket.cat",
        "usernames": ["g1", "rocket.cat"]
      },
      "success": true
    },
  };

  static Map<String, dynamic>? getMapById(int roomNewResponseId) {
    return RoomNewResponseData.roomNewResponseList[roomNewResponseId];
  }

  static RoomNewResponse getById(int roomNewResponseId) {
    return RoomNewResponse.fromMap(
        RoomNewResponseData.roomNewResponseList[roomNewResponseId]);
  }

  static List<RoomNewResponse> getMessageList() {
    return RoomNewResponseData.roomNewResponseList.values
        .map((e) => RoomNewResponse.fromMap(e))
        .toList();
  }
}
