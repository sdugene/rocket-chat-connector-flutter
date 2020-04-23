import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';
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

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  RoomService roomService;

  RoomNew roomNew = RoomNewData.getById(1);

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    roomService = RoomService(httpServiceMock);
  });

  test ('create room', () async {
    Response response = Response(jsonEncode(RoomNewResponseData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/im.create", jsonEncode(roomNew.toMap())))
        .thenAnswer((_) => Future(() => response));

    RoomNewResponse roomNewResponse = await roomService.create(roomNew);
    expect(roomNewResponse.success, true);
  });

  test ('room messages', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");

    Response response = Response(jsonEncode(RoomMessagesData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/im.messages?roomId=${room.id}"))
        .thenAnswer((_) => Future(() => response));

    RoomMessages roomMessages = await roomService.messages(room);
    expect(roomMessages.success, true);
  });

  test ('channel counters without user', () async {
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");

    Response response = Response(jsonEncode(RoomCountersData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/im.counters?roomId=${room.id}"))
        .thenAnswer((_) => Future(() => response));

    RoomCounters roomCounters = await roomService.counters(room);
    expect(roomCounters.success, true);
  });

  test ('channel counters with user', () async {
    User user = UserData.getById("aobEdbYhXfu5hkeqG");
    Room room = RoomData.getById("ByehQjC44FwMeiLbX");

    Response response = Response(jsonEncode(RoomCountersData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/im.counters?roomId=${room.id}&userId=${user.id}"))
        .thenAnswer((_) => Future(() => response));

    RoomCounters roomCounters = await roomService.counters(room, user);
    expect(roomCounters.success, true);
  });
}