import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';

import '../scenarios/data/authentication_data.dart';

void main() {
  group('authenticationModel methods', () {
    test('toAndFromMapEmpty', () async {
      Authentication authentication = AuthenticationData.getById(1);
      Map<String, dynamic> authenticationJson = authentication.toMap();

      expect(AuthenticationData.getMapById(1), authenticationJson);
      expect(Authentication.fromMap(authenticationJson), authentication);
    });
  });
}
