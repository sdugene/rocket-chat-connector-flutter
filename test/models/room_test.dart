import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';

import '../scenarios/data/room_data.dart';

void main() {
  group('roomModel methods', () {
    test('toAndFromMapEmpty', () async {
      Room room = RoomData.getById("ew28FnZqipDpvKw3Rrocket.cat");
      Map<String, dynamic> roomJson = room.toMap();

      expect(RoomData.getMapById("ew28FnZqipDpvKw3Rrocket.cat"), roomJson);
      expect(Room.fromMap(roomJson), room);
    });
  });
}
