class NotificationUser {
  String? id;
  String? username;
  String? name;

  NotificationUser({
    this.id,
    this.username,
    this.name,
  });

  NotificationUser.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'];
      username = json['username'];
      name = json['name'];
    }
  }

  @override
  String toString() {
    return 'NotificationUser{id: $id, username: $username, name: $name}';
  }
}
