import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocket_chat_connector_flutter/models/filters/room_counters_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/room_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/room_history_filter.dart';
import 'package:rocket_chat_connector_flutter/models/new/room_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/response.dart';
import 'package:rocket_chat_connector_flutter/models/response/room_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/room_counters.dart';
import 'package:rocket_chat_connector_flutter/models/room_messages.dart';
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
    http.Response response = await _httpService.getWithFilter(
        '/api/v1/im.messages', RoomFilter(room));

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return RoomMessages.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> markAsRead(Room room) async {
    Map<String, String> body = {"rid": room.id};

    http.Response response =
    await _httpService.post('/api/v1/subscriptions.read', jsonEncode(body));
    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return Response.fromMap(jsonDecode(response.body)).success == true;
    }
    return false;
  }

  Future<RoomMessages> history(RoomHistoryFilter filter) async {
    http.Response response =
    await _httpService.getWithFilter('/api/v1/im.history', filter);

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return RoomMessages.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<RoomCounters> counters(RoomCountersFilter filter) async {
    http.Response response =
    await _httpService.getWithFilter('/api/v1/im.counters', filter);

    if (response?.statusCode == 200 && response.body?.isNotEmpty == true) {
      return RoomCounters.fromMap(jsonDecode(response.body));
    }
    return null;
  }
}
