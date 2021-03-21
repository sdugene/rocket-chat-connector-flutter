import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/filters/channel_filter.dart';

class ChannelHistoryFilter extends ChannelFilter {
  DateTime? latest;
  DateTime? oldest;
  bool? inclusive;
  int? offset;
  int? count;
  bool? unreads;

  ChannelHistoryFilter(
    Channel channel, {
    this.latest,
    this.oldest,
    this.inclusive,
    this.offset,
    this.count,
    this.unreads,
  }) : super(channel);

  Map<String, dynamic> toMap() => {
        'roomId': channel.id,
        'latest': latest != null ? latest!.toIso8601String() : null,
        'oldest': oldest != null ? oldest!.toIso8601String() : null,
        'inclusive': inclusive,
        'offset': offset,
        'count': count,
        'unreads': unreads
      };

  @override
  String toString() {
    return 'ChannelHistoryFilter{latest: $latest, oldest: $oldest, inclusive: $inclusive, offset: $offset, count: $count, unreads: $unreads}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ChannelHistoryFilter &&
          runtimeType == other.runtimeType &&
          latest == other.latest &&
          oldest == other.oldest &&
          inclusive == other.inclusive &&
          offset == other.offset &&
          count == other.count &&
          unreads == other.unreads;

  @override
  int get hashCode =>
      super.hashCode ^
      latest.hashCode ^
      oldest.hashCode ^
      inclusive.hashCode ^
      offset.hashCode ^
      count.hashCode ^
      unreads.hashCode;
}
