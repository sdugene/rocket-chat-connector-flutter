import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/new/token_new.dart';

import '../../scenarios/data/new/token_new_data.dart';

void main() {
  group('tokenNewModel methods', () {
    test('toAndFromMapEmpty', () async {
      TokenNew tokenNew = TokenNewData.getById(1);
      Map<String, dynamic> tokenJson = tokenNew.toMap();

      expect(TokenNewData.getMapById(1), tokenJson);
      expect(TokenNew.fromMap(tokenJson), tokenNew);
    });
  });
}
