import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocket_chat_connector_flutter/exceptions/exception.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/channel_counters.dart';
import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_counters_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_history_filter.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/response/response.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class ChannelService {
  HttpService _httpService;

  ChannelService(this._httpService);

  Future<ChannelNewResponse> create(
      ChannelNew channelNew, Authentication authentication) async {
    http.Response response = await _httpService.post(
      '/api/v1/channels.create',
      jsonEncode(channelNew.toMap()),
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return ChannelNewResponse.fromMap(jsonDecode(response.body));
      } else {
        return ChannelNewResponse();
      }
    }
    throw RocketChatException(response.body);
  }

  Future<ChannelMessages> messages(
      Channel channel, Authentication authentication) async {
    http.Response response = await _httpService.getWithFilter(
      '/api/v1/channels.messages',
      ChannelFilter(channel),
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return ChannelMessages.fromMap(jsonDecode(response.body));
      } else {
        return ChannelMessages();
      }
    }
    throw RocketChatException(response.body);
  }

  Future<bool> markAsRead(
      Channel channel, Authentication authentication) async {
    Map<String, String?> body = {"rid": channel.id};

    http.Response response = await _httpService.post(
      '/api/v1/subscriptions.read',
      jsonEncode(body),
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return Response.fromMap(jsonDecode(response.body)).success == true;
      } else {
        return false;
      }
    }
    throw RocketChatException(response.body);
  }

  Future<ChannelMessages> history(
      ChannelHistoryFilter filter, Authentication authentication) async {
    http.Response response = await _httpService.getWithFilter(
      '/api/v1/channels.history',
      filter,
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return ChannelMessages.fromMap(jsonDecode(response.body));
      } else {
        return ChannelMessages();
      }
    }
    throw RocketChatException(response.body);
  }

  Future<ChannelCounters> counters(
    ChannelCountersFilter filter,
    Authentication authentication,
  ) async {
    http.Response response = await _httpService.getWithFilter(
      '/api/v1/channels.counters',
      filter,
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return ChannelCounters.fromMap(jsonDecode(response.body));
      } else {
        return ChannelCounters();
      }
    }
    throw RocketChatException(response.body);
  }
}
