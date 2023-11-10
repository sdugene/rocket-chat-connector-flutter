import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/response/token_new_response.dart';

import '../../scenarios/data/response/token_new_response_data.dart';

void main() {
  group('tokenNewResponseModel methods', () {
    test('toAndFromMapEmpty', () async {
      TokenNewResponse tokenNewResponse = TokenNewResponseData.getById(1);
      Map<String, dynamic> tokenNewResponseJson = tokenNewResponse.toMap();

      expect(TokenNewResponseData.getMapById(1), tokenNewResponseJson);
      expect(TokenNewResponse.fromMap(tokenNewResponseJson),
          tokenNewResponse);
    });
  });
}
