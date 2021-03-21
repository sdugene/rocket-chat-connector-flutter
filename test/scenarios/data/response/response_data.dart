import 'package:rocket_chat_connector_flutter/models/response/response.dart';

class ResponseData {
  static final Map<int, Map<String, dynamic>> responseList = {
    1: {"success": true},
    2: {"success": false},
  };

  static Map<String, dynamic>? getMapById(int responseId) {
    return ResponseData.responseList[responseId];
  }

  static Response getById(int responseId) {
    return Response.fromMap(ResponseData.responseList[responseId]);
  }

  static List<Response> getMessageList() {
    return ResponseData.responseList.values
        .map((e) => Response.fromMap(e))
        .toList();
  }
}
