import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';

import '../scenarios/data/channel_messages_data.dart';

void main() {
  group('channelMessagesModel methods', () {
    test('toAndFromMapEmpty', () async {
      ChannelMessages channelMessages = ChannelMessagesData.getById(1);
      Map<String, dynamic> channelMessagesJson = channelMessages.toMap();

      expect(ChannelMessagesData.getMapById(1), channelMessagesJson);
      expect(ChannelMessages.fromMap(channelMessagesJson), channelMessages);
    });
  });
}
