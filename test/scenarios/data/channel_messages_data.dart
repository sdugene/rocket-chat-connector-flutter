import 'package:rocket_chat_connector_flutter/models/channel_messages.dart';

class ChannelMessagesData {
  static final Map<int, Map<String, dynamic>> channelMessagesList = {
    1: {
      "messages": [
        {
          "_id": "xadufzmxzYQp4H9py",
          "alias": "test",
          "msg": "Example message",
          "parseUrls": true,
          "bot": {"i": "MnQyfhWt5LqZotyfc"},
          "groupable": false,
          "ts": "2018-10-05T01:10:47.524Z",
          "u": {
            "_id": "rocket.cat",
            "username": "rocket.cat",
            "name": "Rocket.Cat"
          },
          "rid": "GENERAL",
          "_updatedAt": "2018-10-05T13:42:51.163Z",
          "reactions": {
            ":grin:": {
              "usernames": ["marcos.defendi"]
            }
          },
          "mentions": [],
          "channels": [],
          "starred": {"_id": "KPkEYwKKBKZnEEPpt"},
          "attachments": []
        },
        {
          "_id": "id-1538701845987",
          "alias": "Gruggy",
          "msg": "This message was edited via API",
          "ts": "2018-10-05T01:10:45.994Z",
          "u": {
            "_id": "rocketchat.internal.admin.test",
            "username": "rocketchat.internal.admin.test",
            "name": "RocketChat Internal Admin Test"
          },
          "rid": "GENERAL",
          "_updatedAt": "2018-10-05T01:10:47.064Z",
          "reactions": {
            ":smile:": {
              "usernames": ["rocketchat.internal.admin.test"]
            },
            ":squid:": {
              "usernames": ["rocketchat.internal.admin.test"]
            },
            ":bee:": {
              "usernames": ["rocketchat.internal.admin.test"]
            },
            ":ant:": {
              "usernames": ["rocketchat.internal.admin.test"]
            }
          },
          "mentions": [],
          "channels": [],
          "emoji": ":smirk:",
          "avatar": "http://res.guggy.com/logo_128.png",
          "attachments": [
            {
              "collapsed": false,
              "color": "#ff0000",
              "text": "Yay for gruggy!",
              "ts": "2016-12-09T16:53:06.761Z",
              "message_link": "https://google.com",
              "thumb_url": "http://res.guggy.com/logo_128.png",
              "author_name": "Bradley Hilton",
              "author_link": "https://rocket.chat/",
              "author_icon":
                  "https://avatars.githubusercontent.com/u/850391?v=3",
              "title": "Attachment Example",
              "title_link": "https://youtube.com",
              "title_link_download": true,
              "image_url": "http://res.guggy.com/logo_128.png",
              "audio_url": "http://www.w3schools.com/tags/horse.mp3",
              "video_url": "http://www.w3schools.com/tags/movie.mp4",
              "fields": [
                {
                  "short": true,
                  "title": "Test",
                  "value": "Testing out something or other"
                },
                {
                  "short": true,
                  "title": "Another Test",
                  "value":
                      "[Link](https://google.com/) something and this and that."
                }
              ]
            }
          ],
          "editedBy": {
            "_id": "rocketchat.internal.admin.test",
            "username": "rocketchat.internal.admin.test"
          },
          "editedAt": "2018-10-05T01:10:46.384Z",
          "urls": []
        },
      ],
      "count": 2,
      "offset": 0,
      "total": 2,
      "success": true
    }
  };

  static Map<String, dynamic>? getMapById(int channelMessagesId) {
    return ChannelMessagesData.channelMessagesList[channelMessagesId];
  }

  static ChannelMessages getById(int channelMessagesId) {
    return ChannelMessages.fromMap(
        ChannelMessagesData.channelMessagesList[channelMessagesId]);
  }

  static List<ChannelMessages> getChannelMessagesList() {
    return ChannelMessagesData.channelMessagesList.values
        .map((e) => ChannelMessages.fromMap(e))
        .toList();
  }
}
