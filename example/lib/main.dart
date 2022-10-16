import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:rocket_chat_flutter_connector/models/authentication.dart';
import 'package:rocket_chat_flutter_connector/models/channel.dart';
import 'package:rocket_chat_flutter_connector/models/room.dart';
import 'package:rocket_chat_flutter_connector/models/user.dart';
import 'package:rocket_chat_flutter_connector/services/authentication_service.dart';
import 'package:rocket_chat_flutter_connector/services/http_service.dart'
    as rocket_http_service;
import 'package:rocket_chat_flutter_connector/web_socket/notification.dart'
    as rocket_notification;
import 'package:rocket_chat_flutter_connector/web_socket/web_socket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.off,
    ),
  );
  runApp(MyApp());
}

final String serverUrl = "serverUrl";
final String webSocketUrl = "webscocket url";
final String username = "user";
final String password = "password";
final Channel channel = Channel(id: "GENERAL");
final Room room = Room(id: "roomId");
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
          logInfo('🚀🚀 FutureBuilder Authentication ${snapshot.hasData}');
          logInfo('🚀🚀 FutureBuilder Authentication error ${snapshot.hasError}');
          if (snapshot.hasData) {
            user = snapshot.data.data.me;
            logInfo('🚀🚀 login ${user.name}');
            webSocketChannel = webSocketService.connectToWebSocket(
                webSocketUrl, authToken: snapshot.data.data.authToken);
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
      body: Column(
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
              rocket_notification.Notification notification = snapshot.hasData
                  ? rocket_notification.Notification.fromMap(
                      jsonDecode(snapshot.data))
                  : null;
              print(notification);
              webSocketService.streamChannelMessagesSubscribe(
                  webSocketChannel, channel);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                    notification != null ? '${(notification?.fields!=null && notification?.fields?.args!=null && notification.fields.args.isNotEmpty)?notification.fields?.args[0].payload.message.msg:''}' : ''),
              );
            },
          )
        ],
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
      // webSocketService.sendMessageOnChannel(
      //     _controller.text, webSocketChannel, channel);
      webSocketService.sendMessageOnRoom(
          _controller.text, webSocketChannel, room);
    }
  }


  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if(_controller.text.isNotEmpty){
        webSocketService.streamNotifyRoom(
             webSocketChannel, user, room);
      }
    });
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
