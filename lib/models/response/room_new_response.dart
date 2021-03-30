import 'package:rocket_chat_connector_flutter/models/room.dart';

class RoomNewResponse {
  Room? room;
  bool? success;

  RoomNewResponse({
    this.room,
    this.success = false,
  });

  RoomNewResponse.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      room = json['room'] != null ? Room.fromMap(json['channel']) : null;
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
        'room': room != null ? room!.toMap() : null,
        'success': success,
      };

  @override
  String toString() {
    return 'RoomNewResponse{room: $room, success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomNewResponse &&
          runtimeType == other.runtimeType &&
          room == other.room &&
          success == other.success;

  @override
  int get hashCode => room.hashCode ^ success.hashCode;
}
