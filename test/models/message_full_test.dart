import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/message_full.dart';

import '../scenarios/data/message_full_data.dart';

void main() {
  group('messageFullModel methods', () {
    test('toAndFromMapEmpty', () async {
      MessageFull messageFull = MessageFullData.getById(1);
      Map<String, dynamic> messageFullJson = messageFull.toMap();

      expect(MessageFullData.getMapById(1), messageFullJson);
      expect(MessageFull.fromMap(messageFullJson), messageFull);
    });
  });
}
