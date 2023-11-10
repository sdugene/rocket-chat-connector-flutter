class TokenNew {
  String? type;
  String? value;
  String? appName;

  TokenNew({
    this.type,
    this.value,
    this.appName,
  });

  TokenNew.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      type = json['type'];
      value = json['value'];
      appName = json['appName'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (type != null) {
      map['type'] = type;
    }
    if (value != null) {
      map['value'] = value;
    }
    if (appName != null) {
      map['appName'] = appName;
    }

    return map;
  }

  @override
  String toString() {
    return 'TokenNew{type: $type, value: $value, appName: $appName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenNew &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          value == other.value &&
          appName == other.appName;

  @override
  int get hashCode =>
      type.hashCode ^ value.hashCode ^ appName.hashCode;
}
