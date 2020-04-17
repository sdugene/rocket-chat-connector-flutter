import 'dart:convert';

import 'package:http/http.dart';
import 'package:rocket_chat_connector_flutter/models/new/user_new.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class UserService {
  HttpService _httpService;

  UserService(this._httpService);

  Future<User> create(UserNew userNew) async {
    Response response = await _httpService.post('/api/v1/users.create', jsonEncode(userNew.toMap()));

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return User.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}