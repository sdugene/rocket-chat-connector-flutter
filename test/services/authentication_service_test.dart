import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart';

import '../scenarios/data/authentication_data.dart';
import '../scenarios/data/user_data.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  AuthenticationService authenticationService;

  String user = 'user';
  String password = 'password';
  String password2 = 'password2';

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    authenticationService = AuthenticationService(httpServiceMock);
  });

  test('authentication success', () async {
    Map<String, String> mappedBody = {'user': user, 'password': password};

    Response response = Response(jsonEncode(AuthenticationData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/user/login", jsonEncode(mappedBody)))
        .thenAnswer((_) => Future(() => response));

    Authentication authentication = await authenticationService.login(user, password);
    expect(authentication.status, AuthenticationData.getById(1).status);
  });

  test('authentication failed', () async {
    Map<String, String> mappedBody = {'user': user, 'password': password};

    Response response = Response(jsonEncode(AuthenticationData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/user/login", jsonEncode(mappedBody)))
        .thenAnswer((_) => Future(() => response));

    Authentication authentication = await authenticationService.login(user, password2);
    expect(authentication, null);
  });

  test ('me', () async {
    Response response = Response(jsonEncode(UserData.getMapById("aobEdbYhXfu5hkeqG")), 200);
    when(httpServiceMock.get("/api/v1/me"))
        .thenAnswer((_) => Future(() => response));

    User me = await authenticationService.me();
    expect(me.username, UserData.getById("aobEdbYhXfu5hkeqG").username);
  });
}