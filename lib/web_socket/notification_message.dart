class NotificationMessage {
  String? msg;

  NotificationMessage(
    this.msg,
  );

  NotificationMessage.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      msg = json['msg'];
    }
  }

  @override
  String toString() {
    return 'NotificationMessage{msg: $msg}';
  }
}
