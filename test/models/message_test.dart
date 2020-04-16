import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';
import '../scenarios/data/message_data.dart';

void main() {
  group('messageModel methods', () {
    test('toAndFromMapEmpty', () async {
      Message message =
        MessageData.getById(1);

      Map<String, dynamic> messageJson = message.toMap();

      expect(
          '{'
              'alias: Gruggy, '
              'avatar: http://res.guggy.com/logo_128.png, '
              'channel: #general, '
              'emoji: :smirk:, '
              'roomId: Xnb2kLD2Pnhdwe3RH, '
              'text: Sample message, '
              'attachments: [{'
                'audio_url: http://www.w3schools.com/tags/horse.mp3, '
                'author_icon: null, '
                'author_link: null, '
                'author_name: null, '
                'collapsed: null, '
                'color: null, '
                'fields: [{'
                  'short: true, '
                  'title: Test, '
                  'value: Testing out something or other'
                '}, {'
                  'short: true, '
                  'title: Another Test, '
                  'value: [Link](https://google.com/) something and this and that.'
                '}], '
                'image_url: http://res.guggy.com/logo_128.png, '
                'message_link: https://google.com, '
                'text: Yay for gruggy!, '
                'thumb_url: http://res.guggy.com/logo_128.png, '
                'title: Attachment Example, '
                'title_link: https://youtube.com, '
                'title_link_download: true, '
                'ts: 2016-12-09T16:53:06.761Z, '
                'video_url: http://www.w3schools.com/tags/movie.mp4'
              '}]'
            '}',
          messageJson.toString());

      expect(Message.fromMap(messageJson), message);
    });
  });
}
