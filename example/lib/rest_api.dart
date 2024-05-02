import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/channel_counters.dart';
import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_counters_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_history_filter.dart';
import 'package:rocket_chat_connector_flutter/models/new/message_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/subscription.dart';
import 'package:rocket_chat_connector_flutter/models/subscription_update.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart'
    as rocket_http_service;
import 'package:rocket_chat_connector_flutter/services/message_service.dart';
import 'package:rocket_chat_connector_flutter/services/subscription_service.dart';

final String serverUrl = "myServerUrl";
final String username = "myUserName";
final String password = "myPassword";
final Channel channel = Channel(id: "myChannelId");

final rocket_http_service.HttpService rocketHttpService =
    rocket_http_service.HttpService(Uri.parse(serverUrl));
final AuthenticationService authenticationService =
    AuthenticationService(rocketHttpService);
final ChannelService channelService = ChannelService(rocketHttpService);
final MessageService messageService = MessageService(rocketHttpService);
final SubscriptionService subscriptionService =
    SubscriptionService(rocketHttpService);

Future main(List<String> args) async {
  Authentication authentication =
      await authenticationService.login(username, password);

  // get all subscription with new messages
  Subscription subscription =
      await subscriptionService.getSubscriptions(authentication);
  List<SubscriptionUpdate> updates =
      subscription.update!.where((e) => e.alert!).toList();

  for (SubscriptionUpdate subscriptionUpdate in updates) {
    print(
        "${subscriptionUpdate.t == "d" ? "Room" : "Channel"} rid ${subscriptionUpdate.rid} named ${subscriptionUpdate.name} have new messages");
  }

  // get channel message counter
  ChannelCountersFilter filter = ChannelCountersFilter(channel);
  ChannelCounters counters =
      await channelService.counters(filter, authentication);
  print("Channel specified have ${counters.unreads} unread messages");

  // get channel message list
  ChannelHistoryFilter channelHistoryFilter =
      ChannelHistoryFilter(channel, count: 50);
  ChannelMessages channelMessages =
      await channelService.history(channelHistoryFilter, authentication);
  print(
      "Last message : ${channelMessages.messages!.first.ts} : ${channelMessages.messages!.first.msg}");

  // send message
  MessageNew messageNew = MessageNew(roomId: channel.id, text: "my message");
  MessageNewResponse response =
      await messageService.postMessage(messageNew, authentication);
  print("Message send success : ${response.success}");
}
