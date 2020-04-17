import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';

import '../scenarios/data/message_data.dart';

void main() {
  group('messageModel methods', () {
    test('toAndFromMapEmpty', () async {
      Message message = MessageData.getById("7aDSXtjMA3KPLxLjt");

      Map<String, dynamic> messageJson = message.toMap();

      expect(
          '{'
            '_id: 7aDSXtjMA3KPLxLjt, '
            'msg: This is a test!, '
            'ts: 2016-12-14T20:56:05.117Z, '
            'u: {'
              '_id: y65tAmHs93aDChMWu, '
              'username: graywolf336'
            '}, '
            'rid: GENERAL'
          '}',
          messageJson.toString());

      expect(Message.fromMap(messageJson), message);
    });
  });
}
