import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/channel_counters.dart';
import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_counters_filter.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_history_filter.dart';
import 'package:rocket_chat_connector_flutter/models/new/message_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart' as rocket_http_service;
import 'package:rocket_chat_connector_flutter/services/message_service.dart';

final String serverUrl = "myServerUrl";
final String username = "myUserName";
final String password = "myPassword";
final Channel channel = Channel(id: "myChannelId");

final rocket_http_service.HttpService rocketHttpService = rocket_http_service.HttpService(serverUrl);
final AuthenticationService authenticationService = AuthenticationService(rocketHttpService);
final ChannelService channelService = ChannelService(rocketHttpService);
final MessageService messageService = MessageService(rocketHttpService);

Future main(List<String> args) async {
  rocket_http_service.HttpService.authentication = await authenticationService.login(username, password);

  // get channel message counter
  ChannelCountersFilter filter = ChannelCountersFilter(channel);
  ChannelCounters counters = await channelService.counters(filter);
  print("Channel have ${counters.unreads} unread messages");

  // get channel message list
  ChannelHistoryFilter channelHistoryFilter = ChannelHistoryFilter(channel, count: 50);
  ChannelMessages channelMessages = await channelService.history(channelHistoryFilter);
  print("Last message : ${channelMessages.messages.first.ts} : ${channelMessages.messages.first.msg}");

  // send message
  MessageNew messageNew = MessageNew(roomId: channel.id, text: "my message");
  MessageNewResponse response = await messageService.postMessage(messageNew);
  print("Message send success : ${response.success}");
}