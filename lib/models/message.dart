import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rocket_chat_connector_flutter/models/message_attachment.dart';

class Message {
  String alias;
  String avatar;
  String channel;
  String emoji;
  String roomId;
  String text;
  List<MessageAttachment> attachments;

  Message({
    this.alias,
    this.avatar,
    this.channel,
    this.emoji,
    this.roomId,
    this.text,
    this.attachments,
  });

  Message.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      alias = json['alias'];
      avatar = json['avatar'];
      channel = json['channel'];
      emoji = json['emoji'];
      roomId = json['roomId'];
      text = json['text'];

      if (json['attachments'] != null) {
        List<dynamic> jsonList = json['attachments'].runtimeType == String //
            ? jsonDecode(json['attachments'])
            : json['attachments'];
        attachments = jsonList.where((json) => json != null).map((json) => MessageAttachment.fromMap(json)).toList();
      }
    }
  }

  Map<String, dynamic> toMap() => {
        'alias': alias,
        'avatar': avatar,
        'channel': channel,
        'emoji': emoji,
        'roomId': roomId,
        'text': text,
        'attachments': attachments?.where((json) => json != null)?.map((attachment) => attachment.toMap())?.toList() ?? [],
      };

  @override
  String toString() {
    return 'Message{alias: $alias, avatar: $avatar, channel: $channel, emoji: $emoji, roomId: $roomId, text: $text, attachments: $attachments}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Message &&
              runtimeType == other.runtimeType &&
              alias == other.alias &&
              avatar == other.avatar &&
              channel == other.channel &&
              emoji == other.emoji &&
              roomId == other.roomId &&
              text == other.text &&
              DeepCollectionEquality().equals(attachments, other.attachments);

  @override
  int get hashCode =>
      alias.hashCode ^
      avatar.hashCode ^
      channel.hashCode ^
      emoji.hashCode ^
      roomId.hashCode ^
      text.hashCode ^
      attachments.hashCode;
}
