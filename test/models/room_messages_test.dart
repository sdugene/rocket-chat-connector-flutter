import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/room_messages.dart';

import '../scenarios/data/room_messages_data.dart';

void main() {
  group('roomMessagesModel methods', () {
    test('toAndFromMapEmpty', () async {
      RoomMessages roomMessages = RoomMessagesData.getById(1);
      Map<String, dynamic> roomMessagesJson = roomMessages.toMap();

      expect(RoomMessagesData.getMapById(1), roomMessagesJson);
      expect(RoomMessages.fromMap(roomMessagesJson), roomMessages);
    });
  });
}
