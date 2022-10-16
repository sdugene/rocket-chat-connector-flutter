import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_flutter_connector/models/authentication.dart';
import 'package:rocket_chat_flutter_connector/models/new/user_new.dart';
import 'package:rocket_chat_flutter_connector/models/user.dart';
import 'package:rocket_chat_flutter_connector/services/http_service.dart';
import 'package:rocket_chat_flutter_connector/services/user_service.dart';

import '../scenarios/data/new/user_new_data.dart';
import '../scenarios/data/user_data.dart';
import 'user_service_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  HttpService? httpServiceMock;
  late UserService userService;
  Authentication authenticationMock = new Authentication();

  UserNew userNew = UserNewData.getById(1);

  setUp(() async {
    httpServiceMock = MockHttpService();
    userService = UserService(httpServiceMock!);
  });

  test('create user', () async {
    Response response =
        Response(jsonEncode(UserData.getMapById("BsNr28znDkG8aeo7W")), 200);
    when(httpServiceMock!.post(
      "/api/v1/users.create",
      jsonEncode(userNew.toMap()),
      authenticationMock,
    )).thenAnswer((_) => Future(() => response));

    User user = await userService.create(userNew, authenticationMock);
    expect(user.success, true);
  });
}
