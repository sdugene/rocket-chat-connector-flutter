import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/room_counters.dart';

import '../scenarios/data/room_counters_data.dart';

void main() {
  group('roomCountersModel methods', () {
    test('toAndFromMapEmpty', () async {
      RoomCounters roomCounters = RoomCountersData.getById(1);
      Map<String, dynamic> roomCountersJson = roomCounters.toMap();

      expect(RoomCountersData.getMapById(1), roomCountersJson);
      expect(RoomCounters.fromMap(roomCountersJson), roomCounters);
    });
  });
}
