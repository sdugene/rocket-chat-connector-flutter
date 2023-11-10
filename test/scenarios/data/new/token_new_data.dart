import 'package:rocket_chat_connector_flutter/models/new/token_new.dart';

class TokenNewData {
  static final Map<int, Map<String, dynamic>> tokenNewList = {
    1: {
      "type": "gcm",
      "value": "TOKEN",
      "appName": "MyApp"
    }
  };

  static Map<String, dynamic>? getMapById(int tokenNewId) {
    return TokenNewData.tokenNewList[tokenNewId];
  }

  static TokenNew getById(int tokenNewId) {
    return TokenNew.fromMap(TokenNewData.tokenNewList[tokenNewId]);
  }

  static List<TokenNew> getTokenNewList() {
    return TokenNewData.tokenNewList.values
        .map((e) => TokenNew.fromMap(e))
        .toList();
  }
}
