import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';
import 'package:rocket_chat_connector_flutter/models/message_response.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_connector_flutter/services/message_service.dart';

import '../scenarios/data/message_response_data.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  MessageService messageService;

  Message message = Message(channel: "#general", text: "This is a test!");

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    messageService = MessageService(httpServiceMock);
  });

  test ('post message', () async {
    Response response = Response(jsonEncode(MessageResponseData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/chat.postMessage", jsonEncode(message.toMap())))
        .thenAnswer((_) => Future(() => response));

    MessageResponse messageResponse = await messageService.postMessage(message);
    expect(messageResponse.success, true);
  });
}