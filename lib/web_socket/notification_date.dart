class NotificationDate {
  int date;

  NotificationDate({
    this.date,
  });

  NotificationDate.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      date = json['\$date'];
    }
  }

  @override
  String toString() {
    return 'NotificationDate{date: $date}';
  }
}
