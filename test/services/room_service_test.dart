import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/filters/room_counters_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/room_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/room_history_filter.dart';
import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/response.dart';
import 'package:rocket_chat_connector_flutter/models/response/room_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/room_counters.dart';
import 'package:rocket_chat_connector_flutter/models/room_messages.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_connector_flutter/services/room_service.dart';

import '../scenarios/data/new/room_new_data.dart';
import '../scenarios/data/response/room_new_response_data.dart';
import '../scenarios/data/room_counters_data.dart';
import '../scenarios/data/room_data.dart';
import '../scenarios/data/room_messages_data.dart';
import '../scenarios/data/user_data.dart';
import 'room_service_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  HttpService? httpServiceMock;
  late RoomService roomService;
  Authentication authenticationMock = new Authentication();

  RoomNew roomNew = RoomNewData.getById(1);

  setUp(() async {
    httpServiceMock = MockHttpService();
    roomService = RoomService(httpServiceMock!);
  });

  test('create room', () async {
    http.Response response =
        http.Response(jsonEncode(RoomNewResponseData.getMapById(1)), 200);
    when(httpServiceMock!.post(
      "/api/v1/im.create",
      jsonEncode(roomNew.toMap()),
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    RoomNewResponse roomNewResponse =
        await roomService.create(roomNew, authenticationMock);
    expect(roomNewResponse.success, true);
  });

  test('room messages', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");
    RoomFilter filter = RoomFilter(room);

    http.Response response =
        http.Response(jsonEncode(RoomMessagesData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/im.messages",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    RoomMessages roomMessages =
        await roomService.messages(room, authenticationMock);
    expect(roomMessages.success, true);
  });

  test('room markAsRead', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");
    Map<String, String?> body = {"rid": room.id};

    http.Response response =
        http.Response(jsonEncode(Response(success: true).toMap()), 200);
    when(httpServiceMock!.post(
      "/api/v1/subscriptions.read",
      jsonEncode(body),
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    bool success = await roomService.markAsRead(room, authenticationMock);
    expect(success, true);
  });

  test('room counters without user', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");
    RoomCountersFilter filter = RoomCountersFilter(room);

    http.Response response =
        http.Response(jsonEncode(RoomCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/im.counters",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    RoomCounters roomCounters =
        await roomService.counters(filter, authenticationMock);
    expect(roomCounters.success, true);
  });

  test('room counters with user', () async {
    User user = UserData.getById("aobEdbYhXfu5hkeqG");
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");
    RoomCountersFilter filter = RoomCountersFilter(room, user: user);

    http.Response response =
        http.Response(jsonEncode(RoomCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/im.counters",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    RoomCounters roomCounters =
        await roomService.counters(filter, authenticationMock);
    expect(roomCounters.success, true);
  });

  test('room history', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");
    RoomHistoryFilter filter = RoomHistoryFilter(room);

    http.Response response =
        http.Response(jsonEncode(RoomCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/im.history",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    RoomMessages roomMessages =
        await roomService.history(filter, authenticationMock);
    expect(roomMessages.success, true);
  });

  test('room history with date', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");
    RoomHistoryFilter filter = RoomHistoryFilter(room, latest: DateTime.now());

    http.Response response =
        http.Response(jsonEncode(RoomCountersData.getMapById(1)), 200);
    when(httpServiceMock!.getWithFilter(
      "/api/v1/im.history",
      filter,
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    RoomMessages roomMessages =
        await roomService.history(filter, authenticationMock);
    expect(roomMessages.success, true);
  });
}
