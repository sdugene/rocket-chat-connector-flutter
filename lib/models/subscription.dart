import 'dart:convert';

import 'package:rocket_chat_connector_flutter/models/subscription_update.dart';

class Subscription {
  List<SubscriptionUpdate>? update;
  Object? remove;
  bool? success;

  Subscription({
    this.update,
    this.remove,
    this.success,
  });

  Subscription.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      if (json['update'] != null) {
        List<dynamic> jsonList = json['update'].runtimeType == String //
            ? jsonDecode(json['update'])
            : json['update'];
        update = jsonList
            .where((json) => json != null)
            .map((value) => SubscriptionUpdate.fromMap(value))
            .toList();
      } else {
        update = null;
      }

      remove = json['remove'] != null ? json['remove'] : null;
      success = json['success'];
    }
  }

  @override
  String toString() {
    return 'Subscription{update: $update, remove: $remove, success: $success}';
  }
}
