import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';

class RoomNewData {
  static final Map<int, Map<String, dynamic>> roomNewList = {
    1: {"username": "rocket.cat"}
  };

  static Map<String, dynamic>? getMapById(int roomNewId) {
    return RoomNewData.roomNewList[roomNewId];
  }

  static RoomNew getById(int channelId) {
    return RoomNew.fromMap(RoomNewData.roomNewList[channelId]);
  }

  static List<RoomNew> getRoomNewList() {
    return RoomNewData.roomNewList.values
        .map((e) => RoomNew.fromMap(e))
        .toList();
  }
}
