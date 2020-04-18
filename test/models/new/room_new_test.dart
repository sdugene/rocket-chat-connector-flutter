import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';

import '../../scenarios/data/new/room_new_data.dart';

void main() {
  group('roomNewModel methods', () {
    test('toAndFromMapEmpty', () async {
      RoomNew roomNew = RoomNewData.getById(1);
      Map<String, dynamic> roomNewJson = roomNew.toMap();

      expect(RoomNewData.getMapById(1), roomNewJson);
      expect(RoomNew.fromMap(roomNewJson), roomNew);
    });
  });
}
