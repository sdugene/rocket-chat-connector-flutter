import 'package:rocket_chat_connector_flutter/models/room.dart';

class RoomData {
  static final Map<String, Map<String, dynamic>> roomList = {
    "ew28FnZqipDpvKw3Rrocket.cat": {
      "_id": "ew28FnZqipDpvKw3Rrocket.cat",
      "_updatedAt": "2018-02-23T17:58:56.147Z",
      "t": "d",
      "msgs": 22,
      "ts": "2018-02-18T19:51:52.557Z",
      "lm": "2018-02-23T17:58:56.136Z",
      "topic": "a direct message with rocket.cat"
    },
    "RtycPC29hqLJfT9xjew28FnZqipDpvKw3R": {
      "_id": "RtycPC29hqLJfT9xjew28FnZqipDpvKw3R",
      "_updatedAt": "2018-02-23T18:14:03.510Z",
      "t": "d",
      "msgs": 2,
      "ts": "2018-02-21T21:08:51.026Z",
      "lm": "2018-02-23T18:14:03.490Z",
      "username": "rocketchat.internal.admin.test"
    },
    "ew28FnZqipDpvKw3Rf2CAhYGtjS9iNZ7nd": {
      "_id": "ew28FnZqipDpvKw3Rf2CAhYGtjS9iNZ7nd",
      "_updatedAt": "2018-02-23T17:45:56.496Z",
      "t": "d",
      "msgs": 1,
      "ts": "2018-02-23T17:32:28.016Z",
      "lm": "2018-02-23T17:45:56.475Z"
    }
  };

  static Map<String, dynamic>? getMapById(String roomId) {
    return RoomData.roomList[roomId];
  }

  static Room getById(String roomId) {
    return Room.fromMap(RoomData.roomList[roomId]);
  }

  static List<Room> getRoomList() {
    return RoomData.roomList.values.map((e) => Room.fromMap(e)).toList();
  }
}
