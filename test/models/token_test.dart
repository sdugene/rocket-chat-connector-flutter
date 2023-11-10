import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/token.dart';

import '../scenarios/data/token_data.dart';

void main() {
  group('tokenModel methods', () {
    test('toAndFromMapEmpty', () async {
      Token token = TokenData.getById("DMMjKG2hFoLvM2hk7");
      Map<String, dynamic> tokenJson = token.toMap();

      expect(TokenData.getMapById("DMMjKG2hFoLvM2hk7"), tokenJson);
      expect(Token.fromMap(tokenJson), token);
    });
  });
}
