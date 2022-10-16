import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/new/message_new.dart';

import '../../scenarios/data/new/message_new_data.dart';

void main() {
  group('messageNewModel methods', () {
    test('toAndFromMapEmpty', () async {
      MessageNew messageNew = MessageNewData.getById(1);
      Map<String, dynamic> messageNewJson = messageNew.toMap();

      expect(MessageNewData.getMapById(1), messageNewJson);
      expect(MessageNew.fromMap(messageNewJson), messageNew);
    });
  });
}
