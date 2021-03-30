import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/exceptions/exception.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

import '../scenarios/data/authentication_data.dart';
import '../scenarios/data/user_data.dart';
import 'authentication_service_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  HttpService? httpServiceMock;
  late AuthenticationService authenticationService;
  Authentication authenticationMock = new Authentication();

  String user = 'user';
  String password = 'password';
  String password2 = 'password2';

  setUp(() async {
    httpServiceMock = MockHttpService();
    authenticationService = AuthenticationService(httpServiceMock!);
  });

  test('authentication success', () async {
    Map<String, String> mappedBody = {'user': user, 'password': password};

    Response response =
        Response(jsonEncode(AuthenticationData.getMapById(1)), 200);
    when(httpServiceMock!.post("/api/v1/login", jsonEncode(mappedBody), null))
        .thenAnswer((_) => Future(() => response));

    Authentication authentication =
        await authenticationService.login(user, password);
    expect(authentication.status, AuthenticationData.getById(1).status);
  });

  test('authentication failed', () async {
    Map<String, String> mappedBody = {'user': user, 'password': password2};

    Response response =
        Response(jsonEncode(AuthenticationData.getMapById(1)), 400);
    when(httpServiceMock!.post("/api/v1/login", jsonEncode(mappedBody), null))
        .thenAnswer((_) => Future(() => response));

    expect(() => authenticationService.login(user, password2),
        throwsA(isInstanceOf<RocketChatException>()));
  });

  test('me', () async {
    Response response =
        Response(jsonEncode(UserData.getMapById("aobEdbYhXfu5hkeqG")), 200);
    when(httpServiceMock!.get("/api/v1/me", authenticationMock))
        .thenAnswer((_) => Future(() => response));

    User me = await authenticationService.me(authenticationMock);
    expect(me.username, UserData.getById("aobEdbYhXfu5hkeqG").username);
  });
}
