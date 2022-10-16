import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocket_chat_flutter_connector/exceptions/exception.dart';
import 'package:rocket_chat_flutter_connector/models/authentication.dart';
import 'package:rocket_chat_flutter_connector/models/new/user_new.dart';
import 'package:rocket_chat_flutter_connector/models/user.dart';
import 'package:rocket_chat_flutter_connector/services/http_service.dart';

class UserService {
  HttpService _httpService;

  UserService(this._httpService);

  Future<User> create(UserNew userNew, Authentication authentication) async {
    http.Response response = await _httpService.post(
      '/api/v1/users.create',
      jsonEncode(userNew.toMap()),
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return User.fromMap(jsonDecode(response.body));
      } else {
        return User();
      }
    }
    throw RocketChatException(response.body);
  }
}
