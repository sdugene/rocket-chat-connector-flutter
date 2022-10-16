import 'dart:convert';

import 'package:loggy/loggy.dart';
import 'package:rocket_chat_flutter_connector/models/authentication.dart';
import 'package:rocket_chat_flutter_connector/models/channel.dart';
import 'package:rocket_chat_flutter_connector/models/room.dart';
import 'package:rocket_chat_flutter_connector/models/user.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel connectToWebSocket(String url, {required String authToken}) {
    WebSocketChannel webSocketChannel = IOWebSocketChannel.connect(url);
    _sendConnectRequest(webSocketChannel);
    _sendLoginRequest(
      webSocketChannel,
      authToken: authToken,
    );
    return webSocketChannel;
  }

  void _sendConnectRequest(WebSocketChannel webSocketChannel) {
    Map msg = {
      "msg": "connect",
      "version": "1",
      "support": ["1", "pre2", "pre1"]
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void _sendLoginRequest(WebSocketChannel webSocketChannel,
      {required String authToken}) {
    Map msg = {
      "msg": "method",
      "method": "login",
      "id": "17",
      "params": [
        {"resume": authToken}
      ]
    };

    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamNotifyUserSubscribe(WebSocketChannel webSocketChannel, User user) {
    Map msg = {
      "msg": "sub",
      "id": user.id! + DateTime.now().millisecond.toString(),
      "name": "stream-notify-user",
      "params": [
        user.id! + "/notification",
        {
          "useCollection": false,
          "args": []
        }
      ]
    };

    logInfo('🚀🚀  streamNotifyUserSubscribe $msg');

    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamNotifyRoom(
      WebSocketChannel webSocketChannel, User user, Room room) {
    Map msg = {
      "msg": "method",
      "method": "stream-notify-room",
      "id": "42",
      "params": ["${room.id}/typing", user.name, true]
    };
    logInfo('🚀🚀 streamNotifyRoom ${msg}');
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamChannelMessagesSubscribe(
      WebSocketChannel webSocketChannel, Channel channel) {
    Map msg = {
      "msg": "sub",
      "id": channel.id! + "subscription-id",
      "name": "stream-room-messages",
      "params": [channel.id, false]
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamChannelMessagesUnsubscribe(
      WebSocketChannel webSocketChannel, Channel channel) {
    Map msg = {
      "msg": "unsub",
      "id": channel.id! + "subscription-id",
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamRoomMessagesSubscribe(WebSocketChannel webSocketChannel, Room room,
      {required String token}) {
    Map msg = {
      "msg": "sub",
      "id": room.id! + DateTime.now().millisecond.toString(),
      "name": "stream-room-messages",
      "params": [
        room.id,
        {
          "useCollection": false,
          "args": [
          ]
        }
      ]
    };
    logInfo('🚀🚀  streamRoomMessagesSubscribe $msg');
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamRoomMessagesUnsubscribe(
      WebSocketChannel webSocketChannel, Room room) {
    Map msg = {
      "msg": "unsub",
      "id": room.id! + "subscription-id",
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void streamRoomTypingEvent(WebSocketChannel webSocketChannel, String roomId) {
    Map msg = {
      "msg": "sub",
      "id": roomId + "subscription-id",
      "name": "stream-notify-room",
      "params": ["$roomId/event"]
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void sendUserStatusEvent(WebSocketChannel webSocketChannel, String roomId) {
    Map msg = {
      "msg": "sub",
      "id": roomId + "subscription-id",
      "name": "stream-notify-room",
      "params": ["$roomId/event"]
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void sendMessageOnChannel(
      String message, WebSocketChannel webSocketChannel, Channel channel) {
    Map msg = {
      "msg": "method",
      "method": "sendMessage",
      "id": "42",
      "params": [
        {"rid": channel.id, "msg": message}
      ]
    };

    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void sendMessageOnRoom(
      String message, WebSocketChannel webSocketChannel, Room room) {
    Map msg = {
      "msg": "method",
      "method": "sendMessage",
      "id": "42",
      "params": [
        {"rid": room.id, "msg": message}
      ]
    };
    logInfo('🚀🚀 streamNotifyRoom $msg');
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void sendPong(WebSocketChannel webSocketChannel) {
    Map msg = {"msg": "pong"};
    logInfo('🚀🚀 sendPong $msg');
    webSocketChannel.sink.add(jsonEncode(msg));
  }

  void sendUserPresence(WebSocketChannel webSocketChannel) {
    Map msg = {
      "msg": "method",
      "method": "UserPresence:setDefaultStatus",
      "id": "42",
      "params": ["online"]
    };
    webSocketChannel.sink.add(jsonEncode(msg));
  }
}
