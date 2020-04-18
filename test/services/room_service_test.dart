import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/room_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/room_messages.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_connector_flutter/services/room_service.dart';

import '../scenarios/data/new/room_new_data.dart';
import '../scenarios/data/response/room_new_response_data.dart';
import '../scenarios/data/room_messages_data.dart';

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
    Response response = Response(jsonEncode(RoomMessagesData.getMapById(1)), 200);
    when(httpServiceMock.get("/api/v1/im.messages?roomId=ByehQjC44FwMeiLbX"))
        .thenAnswer((_) => Future(() => response));

    RoomMessages roomMessages = await roomService.messages(Room(rid: "ByehQjC44FwMeiLbX"));
    expect(roomMessages.success, true);
  });
}