import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/room_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/room_counters.dart';
import 'package:rocket_chat_connector_flutter/models/room_messages.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class RoomService {
  HttpService _httpService;

  RoomService(this._httpService);

  Future<RoomNewResponse> create(RoomNew roomNew) async {
    http.Response response = await _httpService.post(
        '/api/v1/im.create', jsonEncode(roomNew.toMap()));

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return RoomNewResponse.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<RoomMessages> messages(Room room) async {
    http.Response response =
        await _httpService.get('/api/v1/im.messages?roomId=${room.rid}');

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return RoomMessages.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<RoomCounters> counters(Room room, [User user]) async {
    http.Response response;
    if (user != null) {
      response = await _httpService
          .get('/api/v1/im.counters?roomId=${room.id}&userId=${user.id}');
    } else {
      response =
          await _httpService.get('/api/v1/im.counters?roomId=${room.id}');
    }

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return RoomCounters.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}
