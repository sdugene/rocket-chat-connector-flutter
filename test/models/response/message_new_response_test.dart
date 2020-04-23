import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';

import '../../scenarios/data/response/message_new_response_data.dart';

void main() {
  group('messageNewResponseModel methods', () {
    test('toAndFromMapEmpty', () async {
      MessageNewResponse messageNewResponse = MessageNewResponseData.getById(1);
      Map<String, dynamic> messageNewResponseJson = messageNewResponse.toMap();

      expect(MessageNewResponseData.getMapById(1), messageNewResponseJson);
      expect(MessageNewResponse.fromMap(messageNewResponseJson),
          messageNewResponse);
    });
  });
}
