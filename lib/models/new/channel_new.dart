class ChannelNew {
  String? name;

  ChannelNew({
    this.name,
  });

  ChannelNew.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (name != null) {
      map['name'] = name;
    }

    return map;
  }

  @override
  String toString() {
    return 'ChannelNew{name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelNew &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
