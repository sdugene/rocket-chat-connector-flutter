import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/new/token_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/token_new_response.dart';
import 'package:rocket_chat_connector_flutter/services/push_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

import '../scenarios/data/new/token_new_data.dart';
import '../scenarios/data/response/token_new_response_data.dart';
import 'channel_service_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  HttpService? httpServiceMock;
  late PushService pushService;
  Authentication authenticationMock = new Authentication();

  TokenNew tokenNew = TokenNewData.getById(1);

  setUp(() async {
    httpServiceMock = MockHttpService();
    pushService = PushService(httpServiceMock!);
  });

  test('push token', () async {
    http.Response response =
        http.Response(jsonEncode(TokenNewResponseData.getMapById(1)), 200);
    when(httpServiceMock!.post(
      "/api/v1/push.token",
      jsonEncode(tokenNew.toMap()),
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    TokenNewResponse tokenNewResponse =
        await pushService.create(tokenNew, authenticationMock);
    expect(tokenNewResponse.success, true);
  });
}
