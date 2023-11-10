import 'package:rocket_chat_connector_flutter/models/response/token_new_response.dart';

class TokenNewResponseData {
  static final Map<int, Map<String, dynamic>> tokenNewResponseList = {
    1: {
      "result": {
        "token": {
          "gcm": "TOKEN"
        },
        "appName": "RocketAPP",
        "userId": "52d5Rw8LT3TeDa59Z",
        "enabled": true,
        "createdAt": "2018-09-11T18:22:55.006Z",
        "updatedAt": "2018-09-11T18:22:55.006Z",
        "_id": "DMMjKG2hFoLvM2hk7"
      },
      "success": true
    },
  };

  static Map<String, dynamic>? getMapById(int tokenNewResponseId) {
    return TokenNewResponseData.tokenNewResponseList[tokenNewResponseId];
  }

  static TokenNewResponse getById(int tokenNewResponseId) {
    return TokenNewResponse.fromMap(
        TokenNewResponseData.tokenNewResponseList[tokenNewResponseId]);
  }

  static List<TokenNewResponse> getMessageList() {
    return TokenNewResponseData.tokenNewResponseList.values
        .map((e) => TokenNewResponse.fromMap(e))
        .toList();
  }
}
