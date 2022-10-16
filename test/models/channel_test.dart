import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/channel.dart';

import '../scenarios/data/channel_data.dart';

void main() {
  group('channelModel methods', () {
    test('toAndFromMapEmpty', () async {
      Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
      Map<String, dynamic> channelJson = channel.toMap();

      expect(ChannelData.getMapById("ByehQjC44FwMeiLbX"), channelJson);
      expect(Channel.fromMap(channelJson), channel);
    });
  });
}
