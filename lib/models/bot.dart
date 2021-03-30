class Bot {
  String? i;

  Bot({
    this.i,
  });

  Bot.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      i = json['i'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (i != null) {
      map['i'] = i;
    }

    return map;
  }

  @override
  String toString() {
    return 'bot{i: $i}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bot && runtimeType == other.runtimeType && i == other.i;

  @override
  int get hashCode => i.hashCode;
}
