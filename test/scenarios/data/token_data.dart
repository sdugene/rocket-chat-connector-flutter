import 'package:rocket_chat_connector_flutter/models/token.dart';

class TokenData {
  static final Map<String, Map<String, dynamic>> tokenList = {
    "DMMjKG2hFoLvM2hk7": {
      "token": {
        "gcm": "TOKEN"
      },
      "appName": "RocketAPP",
      "userId": "52d5Rw8LT3TeDa59Z",
      "enabled": true,
      "createdAt": "2018-09-11T18:22:55.006Z",
      "updatedAt": "2018-09-11T18:22:55.006Z",
      "_id": "DMMjKG2hFoLvM2hk7"
    }
  };

  static Map<String, dynamic>? getMapById(String tokenId) {
    return TokenData.tokenList[tokenId];
  }

  static Token getById(String tokenId) {
    return Token.fromMap(TokenData.tokenList[tokenId]);
  }

  static List<Token> getTokenList() {
    return TokenData.tokenList.values
        .map((e) => Token.fromMap(e))
        .toList();
  }
}
