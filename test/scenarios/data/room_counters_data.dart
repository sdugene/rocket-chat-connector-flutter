import 'package:rocket_chat_connector_flutter/models/room_counters.dart';

class RoomCountersData {
  static final Map<int, Map<String, dynamic>> roomCountersList = {
    1: {
      "joined": true,
      "members": 2,
      "unreads": 0,
      "unreadsFrom": "2018-02-21T21:08:51.026Z",
      "msgs": 0,
      "latest": "2018-02-21T21:08:51.026Z",
      "userMentions": 0,
      "success": true
    }
  };

  static Map<String, dynamic>? getMapById(int roomCountersId) {
    return RoomCountersData.roomCountersList[roomCountersId];
  }

  static RoomCounters getById(int roomCountersId) {
    return RoomCounters.fromMap(
        RoomCountersData.roomCountersList[roomCountersId]);
  }

  static List<RoomCounters> getRoomCountersList() {
    return RoomCountersData.roomCountersList.values
        .map((e) => RoomCounters.fromMap(e))
        .toList();
  }
}
