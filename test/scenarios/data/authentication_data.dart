import 'package:rocket_chat_connector_flutter/models/authentication.dart';

class AuthenticationData {
  static final Map<int, Map<String, dynamic>> authenticationList = {
    1: {
      "status": "success",
      "data": {
        "authToken": "9HqLlyZOugoStsXCUfD_0YdwnNnunAJF8V47U3QHXSq",
        "userId": "aobEdbYhXfu5hkeqG",
        "me": {
          "_id": "aYjNnig8BEAWeQzMh",
          "name": "Rocket Cat",
          "emails": [
            {"address": "rocket.cat@rocket.chat", "verified": false}
          ],
          "status": "offline",
          "statusConnection": "offline",
          "username": "rocket.cat",
          "utcOffset": -3,
          "active": true,
          "roles": ["admin"],
          "settings": {"preferences": {}},
          "avatarUrl": "http://localhost:3000/avatar/test"
        }
      }
    },
  };

  static Map<String, dynamic>? getMapById(int authenticationId) {
    return AuthenticationData.authenticationList[authenticationId];
  }

  static Authentication getById(int authenticationId) {
    return Authentication.fromMap(
        AuthenticationData.authenticationList[authenticationId]);
  }

  static List<Authentication> getAuthenticationList() {
    return AuthenticationData.authenticationList.values
        .map((e) => Authentication.fromMap(e))
        .toList();
  }
}
