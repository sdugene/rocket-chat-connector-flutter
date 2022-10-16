import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/message.dart';

import '../scenarios/data/message_data.dart';

void main() {
  group('messageModel methods', () {
    test('toAndFromMapEmpty', () async {
      Message message = MessageData.getById("7aDSXtjMA3KPLxLjt");
      Map<String, dynamic> messageJson = message.toMap();

      expect(MessageData.getMapById("7aDSXtjMA3KPLxLjt"), messageJson);
      expect(Message.fromMap(messageJson), message);
    });

    test('toAndFromMapEmpty', () async {
      Message message = MessageData.getById("xadufzmxzYQp4H9py");
      Map<String, dynamic> messageJson = message.toMap();

      expect(MessageData.getMapById("xadufzmxzYQp4H9py"), messageJson);
      expect(Message.fromMap(messageJson), message);
    });

    test('toAndFromMapEmpty', () async {
      Message message = MessageData.getById("id-1538701845987");
      Map<String, dynamic> messageJson = message.toMap();

      expect(MessageData.getMapById("id-1538701845987"), messageJson);
      expect(Message.fromMap(messageJson), message);
    });
  });
}
