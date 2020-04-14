import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';

import '../scenarios/data/authentication_data.dart';

void main() {
  group('authenticationModel methods', () {
    test('toAndFromMapEmpty', () async {
      Authentication authentication =
          AuthenticationData.getById(1);

      Map<String, dynamic> authenticationJson = authentication.toMap();

      expect(
          '{'
            'status: success, '
            'data: {'
              'authToken: 9HqLlyZOugoStsXCUfD_0YdwnNnunAJF8V47U3QHXSq, '
              'userId: aobEdbYhXfu5hkeqG, '
              'me: {'
                '_id: aYjNnig8BEAWeQzMh, '
                'name: Rocket Cat, '
                'emails: [{'
                      'address: rocket.cat@rocket.chat, '
                      'verified: false'
                '}], '
                'status: offline, '
                'statusConnection: offline, '
                'username: rocket.cat, '
                'utcOffset: -3, '
                'active: true, '
                'roles: [admin], '
                'settings: {preferences: {}}, '
                'avatarUrl: http://localhost:3000/avatar/test'
              '}'
            '}'
          '}',
          authenticationJson.toString());

      expect(Authentication.fromMap(authenticationJson), authentication);
    });
  });
}
