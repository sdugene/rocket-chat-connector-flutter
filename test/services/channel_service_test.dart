import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/channel_counters.dart';
import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

import '../scenarios/data/channel_counters_data.dart';
import '../scenarios/data/channel_data.dart';
import '../scenarios/data/channel_messages_data.dart';
import '../scenarios/data/new/channel_new_data.dart';
import '../scenarios/data/response/channel_new_response_data.dart';
import '../scenarios/data/user_data.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  ChannelService channelService;

  ChannelNew channelNew = ChannelNewData.getById(1);

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    channelService = ChannelService(httpServiceMock);
  });

  test ('create channel', () async {
    Response response = Response(jsonEncode(ChannelNewResponseData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/channels.create", jsonEncode(channelNew.toMap())))
        .thenAnswer((_) => Future(() => response));

    ChannelNewResponse channelNewResponse = await channelService.create(channelNew);
    expect(channelNewResponse.success, true);
  });

  test ('channel messages', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");

    Response response = Response(jsonEncode(ChannelMessagesData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/channels.messages?roomId=${channel.id}"))
        .thenAnswer((_) => Future(() => response));

    ChannelMessages channelMessages = await channelService.messages(channel);
    expect(channelMessages.success, true);
  });

  test ('channel counters without user', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");

    Response response = Response(jsonEncode(ChannelCountersData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/channels.counters?roomId=${channel.id}"))
        .thenAnswer((_) => Future(() => response));

    ChannelCounters channelCounters = await channelService.counters(channel);
    expect(channelCounters.success, true);
  });

  test ('channel counters with user', () async {
    User user = UserData.getById("aobEdbYhXfu5hkeqG");
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");

    Response response = Response(jsonEncode(ChannelCountersData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/channels.counters?roomId=${channel.id}&userId=${user.id}"))
        .thenAnswer((_) => Future(() => response));

    ChannelCounters channelCounters = await channelService.counters(channel, user);
    expect(channelCounters.success, true);
  });
}