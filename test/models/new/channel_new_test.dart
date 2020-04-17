import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';

import '../../scenarios/data/new/channel_new_data.dart';

void main() {
  group('channelNewModel methods', () {
    test('toAndFromMapEmpty', () async {
      ChannelNew channelNew = ChannelNewData.getById(1);
      Map<String, dynamic> channelNewJson = channelNew.toMap();

      expect(ChannelNewData.getMapById(1), channelNewJson);
      expect(ChannelNew.fromMap(channelNewJson), channelNew);
    });
  });
}
