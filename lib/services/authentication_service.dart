import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class AuthenticationService {
  HttpService _httpService;

  AuthenticationService(this._httpService);

  Future<Authentication> login(String user, String password) async {
    Map<String, String> body = {'user': user, 'password': password};
    http.Response response =
        await _httpService.post('/api/v1/login', jsonEncode(body));

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return Authentication.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<User> me() async {
    http.Response response = await _httpService.get('/api/v1/me');

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return User.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}
