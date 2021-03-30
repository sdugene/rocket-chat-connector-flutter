import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart'
    as rocket_http_service;
import 'package:rocket_chat_connector_flutter/web_socket/notification.dart'
    as rocket_notification;
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(MyApp());

final String serverUrl = "myServerUrl";
final String webSocketUrl = "myWebSocketUrl";
final String username = "myUserName";
final String password = "myPassword";
final Channel channel = Channel(id: "myChannelId");
final Room room = Room(id: "myRoomId");
final rocket_http_service.HttpService rocketHttpService =
    rocket_http_service.HttpService(Uri.parse(serverUrl));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Rocket Chat WebSocket Demo';

    return MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  WebSocketChannel webSocketChannel;
  WebSocketService webSocketService = WebSocketService();
  User user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Authentication>(
        future: getAuthentication(),
        builder: (context, AsyncSnapshot<Authentication> snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data.data.me;
            webSocketChannel = webSocketService.connectToWebSocket(
                webSocketUrl, snapshot.data);
            webSocketService.streamNotifyUserSubscribe(webSocketChannel, user);
            return _getScaffold();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Scaffold _getScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: webSocketChannel.stream,
              builder: (context, snapshot) {
                print(snapshot.data);
                rocket_notification.Notification notification = snapshot.hasData
                    ? rocket_notification.Notification.fromMap(
                        jsonDecode(snapshot.data))
                    : null;
                print(notification);
                webSocketService.streamNotifyUserSubscribe(
                    webSocketChannel, user);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                      notification != null ? '${notification.toString()}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      webSocketService.sendMessageOnChannel(
          _controller.text, webSocketChannel, channel);
      webSocketService.sendMessageOnRoom(
          _controller.text, webSocketChannel, room);
    }
  }

  @override
  void dispose() {
    webSocketChannel.sink.close();
    super.dispose();
  }

  Future<Authentication> getAuthentication() async {
    final AuthenticationService authenticationService =
        AuthenticationService(rocketHttpService);
    return await authenticationService.login(username, password);
  }
}
