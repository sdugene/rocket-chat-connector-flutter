import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocket_chat_connector_flutter/exceptions/exception.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/subscription.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

class SubscriptionService {
  HttpService _httpService;

  SubscriptionService(this._httpService);

  Future<Subscription> getSubscriptions(Authentication authentication) async {
    http.Response response = await _httpService.get(
      '/api/v1/subscriptions.get',
      authentication,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty == true) {
        return Subscription.fromMap(jsonDecode(response.body));
      } else {
        return Subscription();
      }
    }
    throw RocketChatException(response.body);
  }
}
