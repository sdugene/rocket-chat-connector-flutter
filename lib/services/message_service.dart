import 'dart:convert';

import 'package:http/http.dart';
import 'package:rocket_chat_connector_flutter/models/new/message_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class MessageService {
  HttpService _httpService;

  MessageService(this._httpService);

  Future<MessageNewResponse> postMessage(MessageNew message) async {
    Response response = await _httpService.post('/api/v1/chat.postMessage', jsonEncode(message.toMap()));

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return MessageNewResponse.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}