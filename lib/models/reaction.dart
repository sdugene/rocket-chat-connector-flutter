import 'package:collection/collection.dart';

class Reaction {
  List<String>? usernames;

  Reaction({
    this.usernames,
  });

  Reaction.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      usernames = List<String>.from(json['usernames']);
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (usernames != null) {
      map['usernames'] = usernames;
    }

    return map;
  }

  @override
  String toString() {
    return 'Reaction{usernames: $usernames}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reaction &&
          runtimeType == other.runtimeType &&
          DeepCollectionEquality().equals(usernames, other.usernames);

  @override
  int get hashCode => usernames.hashCode;
}
