import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/response/channel_new_response.dart';

import '../../scenarios/data/response/channel_new_response_data.dart';

void main() {
  group('channelNewResponseModel methods', () {
    test('toAndFromMapEmpty', () async {
      ChannelNewResponse channelNewResponse = ChannelNewResponseData.getById(1);
      Map<String, dynamic> channelNewResponseJson = channelNewResponse.toMap();

      expect(ChannelNewResponseData.getMapById(1), channelNewResponseJson);
      expect(ChannelNewResponse.fromMap(channelNewResponseJson),
          channelNewResponse);
    });
  });
}
