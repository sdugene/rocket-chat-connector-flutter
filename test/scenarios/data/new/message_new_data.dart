import 'package:rocket_chat_connector_flutter/models/new/message_new.dart';

class MessageNewData {
  static final Map<int, Map<String, dynamic>> messageNewList = {
    1: {
      "alias": "Gruggy",
      "avatar": "http://res.guggy.com/logo_128.png",
      "channel": "#general",
      "emoji": ":smirk:",
      "roomId": "Xnb2kLD2Pnhdwe3RH",
      "text": "Sample message",
      "attachments": [
        {
          "audio_url": "http://www.w3schools.com/tags/horse.mp3",
          "author_icon": "https://avatars.githubusercontent.com/u/850391?v=3",
          "author_link": "https://rocket.chat/",
          "author_name": "Bradley Hilton",
          "collapsed": false,
          "color": "#ff0000",
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
          ],
          "image_url": "http://res.guggy.com/logo_128.png",
          "message_link": "https://google.com",
          "text": "Yay for gruggy!",
          "thumb_url": "http://res.guggy.com/logo_128.png",
          "title": "Attachment Example",
          "title_link": "https://youtube.com",
          "title_link_download": true,
          "ts": "2016-12-09T16:53:06.761Z",
          "video_url": "http://www.w3schools.com/tags/movie.mp4"
        }
      ]
    },
  };

  static Map<String, dynamic>? getMapById(int messageNewId) {
    return MessageNewData.messageNewList[messageNewId];
  }

  static MessageNew getById(int messageNewId) {
    return MessageNew.fromMap(MessageNewData.messageNewList[messageNewId]);
  }

  static List<MessageNew> getMessageNewList() {
    return MessageNewData.messageNewList.values
        .map((e) => MessageNew.fromMap(e))
        .toList();
  }
}
