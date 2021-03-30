import 'package:rocket_chat_connector_flutter/models/filters/room_filter.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';

class RoomHistoryFilter extends RoomFilter {
  DateTime? latest;
  DateTime? oldest;
  bool? inclusive;
  int? offset;
  int? count;
  bool? unreads;

  RoomHistoryFilter(
    Room room, {
    this.latest,
    this.oldest,
    this.inclusive,
    this.offset,
    this.count,
    this.unreads,
  }) : super(room);

  Map<String, dynamic> toMap() => {
        'roomId': room.id,
        'latest': latest != null ? latest!.toIso8601String() : null,
        'oldest': oldest != null ? oldest!.toIso8601String() : null,
        'inclusive': inclusive,
        'offset': offset,
        'count': count,
        'unreads': unreads
      };

  @override
  String toString() {
    return 'RoomHistoryFilter{latest: $latest, oldest: $oldest, inclusive: $inclusive, offset: $offset, count: $count, unreads: $unreads}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is RoomHistoryFilter &&
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
