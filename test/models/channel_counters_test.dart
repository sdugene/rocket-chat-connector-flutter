import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/channel_counters.dart';

import '../scenarios/data/channel_counters_data.dart';

void main() {
  group('channelCountersModel methods', () {
    test('toAndFromMapEmpty', () async {
      ChannelCounters channelCounters = ChannelCountersData.getById(1);
      Map<String, dynamic> channelCountersJson = channelCounters.toMap();

      expect(ChannelCountersData.getMapById(1), channelCountersJson);
      expect(ChannelCounters.fromMap(channelCountersJson), channelCounters);
    });
  });
}
