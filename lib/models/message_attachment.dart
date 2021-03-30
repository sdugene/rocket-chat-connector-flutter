import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rocket_chat_connector_flutter/models/message_attachment_field.dart';

class MessageAttachment {
  String? audioUrl;
  String? authorIcon;
  String? authorLink;
  String? authorName;
  bool? collapsed;
  String? color;
  List<MessageAttachmentField>? fields;
  String? imageUrl;
  String? messageLink;
  String? text;
  String? thumbUrl;
  String? title;
  String? titleLink;
  bool? titleLinkDownload;
  DateTime? ts;
  String? videoUrl;

  MessageAttachment({
    this.audioUrl,
    this.authorIcon,
    this.authorLink,
    this.authorName,
    this.collapsed,
    this.color,
    this.fields,
    this.imageUrl,
    this.messageLink,
    this.text,
    this.thumbUrl,
    this.title,
    this.titleLink,
    this.titleLinkDownload,
    this.ts,
    this.videoUrl,
  });

  MessageAttachment.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      audioUrl = json['audio_url'];
      authorIcon = json['author_icon'];
      authorLink = json['author_link'];
      authorName = json['author_name'];
      collapsed = json['collapsed'];
      color = json['color'];

      if (json['fields'] != null) {
        List<dynamic> jsonList = json['fields'].runtimeType == String //
            ? jsonDecode(json['fields'])
            : json['fields'];
        fields = jsonList
            .where((json) => json != null)
            .map((json) => MessageAttachmentField.fromMap(json))
            .toList();
      } else {
        fields = null;
      }

      imageUrl = json['image_url'];
      messageLink = json['message_link'];
      text = json['text'];
      thumbUrl = json['thumb_url'];
      title = json['title'];
      titleLink = json['title_link'];
      titleLinkDownload = json['title_link_download'];
      ts = DateTime.parse(json['ts']);
      videoUrl = json['video_url'];
    }
  }

  Map<String, dynamic> toMap() => {
        'audio_url': audioUrl,
        'author_icon': authorIcon,
        'author_link': authorLink,
        'author_name': authorName,
        'collapsed': collapsed,
        'color': color,
        'fields': fields
                ?.where((json) => json != null)
                ?.map((field) => field.toMap())
                ?.toList() ??
            [],
        'image_url': imageUrl,
        'message_link': messageLink,
        'text': text,
        'thumb_url': thumbUrl,
        'title': title,
        'title_link': titleLink,
        'title_link_download': titleLinkDownload,
        'ts': ts != null ? ts!.toIso8601String() : null,
        'video_url': videoUrl,
      };

  @override
  String toString() {
    return 'MessageAttachment{audioUrl: $audioUrl, authorIcon: $authorIcon, authorLink: $authorLink, authorName: $authorName, collapsed: $collapsed, color: $color, fields: $fields, imageUrl: $imageUrl, messageLink: $messageLink, text: $text, thumbUrl: $thumbUrl, title: $title, titleLink: $titleLink, titleLinkDownload: $titleLinkDownload, ts: $ts, videoUrl: $videoUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAttachment &&
          runtimeType == other.runtimeType &&
          audioUrl == other.audioUrl &&
          authorIcon == other.authorIcon &&
          authorLink == other.authorLink &&
          authorName == other.authorName &&
          collapsed == other.collapsed &&
          color == other.color &&
          DeepCollectionEquality().equals(fields, other.fields) &&
          imageUrl == other.imageUrl &&
          messageLink == other.messageLink &&
          text == other.text &&
          thumbUrl == other.thumbUrl &&
          title == other.title &&
          titleLink == other.titleLink &&
          titleLinkDownload == other.titleLinkDownload &&
          ts == other.ts &&
          videoUrl == other.videoUrl;

  @override
  int get hashCode =>
      audioUrl.hashCode ^
      authorIcon.hashCode ^
      authorLink.hashCode ^
      authorName.hashCode ^
      collapsed.hashCode ^
      color.hashCode ^
      fields.hashCode ^
      imageUrl.hashCode ^
      messageLink.hashCode ^
      text.hashCode ^
      thumbUrl.hashCode ^
      title.hashCode ^
      titleLink.hashCode ^
      titleLinkDownload.hashCode ^
      ts.hashCode ^
      videoUrl.hashCode;
}
