class RoomNew {
  String? username;

  RoomNew({
    this.username,
  });

  RoomNew.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      username = json['username'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (username != null) {
      map['username'] = username;
    }

    return map;
  }

  @override
  String toString() {
    return 'RoomNew{username: $username}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomNew &&
          runtimeType == other.runtimeType &&
          username == other.username;

  @override
  int get hashCode => username.hashCode;
}
