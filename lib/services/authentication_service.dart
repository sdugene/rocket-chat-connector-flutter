import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loggy/loggy.dart';
import 'package:rocket_chat_flutter_connector/exceptions/exception.dart';
import 'package:rocket_chat_flutter_connector/models/authentication.dart';
import 'package:rocket_chat_flutter_connector/models/user.dart';
import 'package:rocket_chat_flutter_connector/services/http_service.dart';

class AuthenticationService {
  HttpService _httpService;

  AuthenticationService(this._httpService);

  Future<Authentication> login(String user, String password) async {
    Map<String, String> body = {'user': user, 'password': password};
    logInfo('🚀🚀 login $body');
    http.Response response = await _httpService.post(
      '/api/v1/login',
      jsonEncode(body),
      null,
    );
    if (response.statusCode == 200 && response.body.isNotEmpty == true) {
      logInfo('🚀🚀 login ${response.body}');
      try{
        return Authentication.fromMap(jsonDecode(response.body));
      } catch(error){
        logError(error);
      }
    }
    throw RocketChatException(response.body);
  }

  Future<User> me(Authentication authentication) async {
    http.Response response = await _httpService.get(
      '/api/v1/me',
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
