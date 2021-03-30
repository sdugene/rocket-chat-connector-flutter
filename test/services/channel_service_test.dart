import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/channel_counters.dart';
import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_counters_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_history_filter.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/response/response.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

import '../scenarios/data/channel_counters_data.dart';
import '../scenarios/data/channel_data.dart';
import '../scenarios/data/channel_messages_data.dart';
import '../scenarios/data/new/channel_new_data.dart';
import '../scenarios/data/response/channel_new_response_data.dart';
import '../scenarios/data/user_data.dart';
import 'channel_service_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  HttpService? httpServiceMock;
  late ChannelService channelService;
  Authentication authenticationMock = new Authentication();

  ChannelNew channelNew = ChannelNewData.getById(1);

  setUp(() async {
    httpServiceMock = MockHttpService();
    channelService = ChannelService(httpServiceMock!);
  });

  test('create channel', () async {
    http.Response response =
        http.Response(jsonEncode(ChannelNewResponseData.getMapById(1)), 200);
    when(httpServiceMock!.post(
      "/api/v1/channels.create",
      jsonEncode(channelNew.toMap()),
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    ChannelNewResponse channelNewResponse =
        await channelService.create(channelNew, authenticationMock);
    expect(channelNewResponse.success, true);
  });

  test('channel messages', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
    ChannelFilter filter = ChannelFilter(channel);

    http.Response response =
        http.Response(jsonEncode(ChannelMessagesData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/channels.messages",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    ChannelMessages channelMessages =
        await channelService.messages(channel, authenticationMock);
    expect(channelMessages.success, true);
  });

  test('channel markAsRead', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
    Map<String, String?> body = {"rid": channel.id};

    http.Response response =
        http.Response(jsonEncode(Response(success: true).toMap()), 200);
    when(httpServiceMock!.post(
      "/api/v1/subscriptions.read",
      jsonEncode(body),
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    bool success = await channelService.markAsRead(channel, authenticationMock);
    expect(success, true);
  });

  test('channel counters without user', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
    ChannelCountersFilter filter = ChannelCountersFilter(channel);

    http.Response response =
        http.Response(jsonEncode(ChannelCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/channels.counters",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    ChannelCounters channelCounters =
        await channelService.counters(filter, authenticationMock);
    expect(channelCounters.success, true);
  });

  test('channel counters with user', () async {
    User user = UserData.getById("aobEdbYhXfu5hkeqG");
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
    ChannelCountersFilter filter = ChannelCountersFilter(channel, user: user);

    http.Response response =
        http.Response(jsonEncode(ChannelCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/channels.counters",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    ChannelCounters channelCounters =
        await channelService.counters(filter, authenticationMock);
    expect(channelCounters.success, true);
  });

  test('channel history', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
    ChannelHistoryFilter filter = ChannelHistoryFilter(channel);

    http.Response response =
        http.Response(jsonEncode(ChannelCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/channels.history",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    ChannelMessages channelMessages =
        await channelService.history(filter, authenticationMock);
    expect(channelMessages.success, true);
  });

  test('channel history with date', () async {
    Channel channel = ChannelData.getById("ByehQjC44FwMeiLbX");
    ChannelHistoryFilter filter =
        ChannelHistoryFilter(channel, latest: DateTime.now());

    http.Response response =
        http.Response(jsonEncode(ChannelCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/channels.history",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    ChannelMessages channelMessages =
        await channelService.history(filter, authenticationMock);
    expect(channelMessages.success, true);
  });
}
