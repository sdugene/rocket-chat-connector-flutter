import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/new/user_new.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_connector_flutter/services/user_service.dart';

import '../scenarios/data/new/user_new_data.dart';
import '../scenarios/data/user_data.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  UserService userService;

  UserNew userNew = UserNewData.getById(1);

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    userService = UserService(httpServiceMock);
  });

  test ('post message', () async {
    Response response = Response(jsonEncode(UserData.getMapById("BsNr28znDkG8aeo7W")), 200);
    when(httpServiceMock.post("/api/v1/users.create", jsonEncode(userNew.toMap())))
        .thenAnswer((_) => Future(() => response));

    User user = await userService.create(userNew);
    expect(user.success, true);
  });
}