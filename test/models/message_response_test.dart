import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/message_response.dart';

import '../scenarios/data/message_response_data.dart';

void main() {
  group('messageResponseModel methods', () {
    test('toAndFromMapEmpty', () async {
      MessageResponse messageResponse = MessageResponseData.getById(1);

      Map<String, dynamic> messageResponseJson = messageResponse.toMap();

      expect(
          '{'
              'ts: 1481748965123, '
              'channel: general, '
              'message: {'
                'alias: , '
                'msg: This is a test!, '
                'parseUrls: true, '
                'groupable: false, '
                'ts: 2016-12-14T20:56:05.117Z, '
                'u: {'
                  '_id: y65tAmHs93aDChMWu, '
                  'name: null, '
                  'emails: [], '
                  'status: null, '
                  'statusConnection: null, '
                  'username: graywolf336, '
                  'utcOffset: null, '
                  'active: null, '
                  'roles: [], '
                  'settings: null, '
                  'avatarUrl: null, '
                  'customFields: null, '
                  'success: null'
                '}, '
                'rid: GENERAL, '
                '_updatedAt: 2016-12-14T20:56:05.119Z, '
                '_id: jC9chsFddTvsbFQG7'
              '}, '
              'success: true'
            '}',
          messageResponseJson.toString());

      expect(MessageResponse.fromMap(messageResponseJson), messageResponse);
    });
  });
}
