import 'dart:convert';

import 'package:http/http.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class ChannelService {
  HttpService _httpService;

  ChannelService(this._httpService);

  Future<ChannelNewResponse> create(ChannelNew channelNew) async {
    Response response = await _httpService.post('/api/v1/channels.create', jsonEncode(channelNew.toMap()));

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return ChannelNewResponse.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}