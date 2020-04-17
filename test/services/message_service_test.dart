import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/message_full.dart';
import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_connector_flutter/services/message_service.dart';

import '../scenarios/data/response/message_new_response_data.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  MessageService messageService;

  MessageFull message = MessageFull(channel: "#general", text: "This is a test!");

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    messageService = MessageService(httpServiceMock);
  });

  test ('post message', () async {
    Response response = Response(jsonEncode(MessageNewResponseData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/chat.postMessage", jsonEncode(message.toMap())))
        .thenAnswer((_) => Future(() => response));

    MessageNewResponse messageResponse = await messageService.postMessage(message);
    expect(messageResponse.success, true);
  });
}