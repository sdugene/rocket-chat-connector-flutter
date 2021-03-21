class UserNew {
  String? name;
  String? email;
  String? password;
  String? username;

  UserNew({
    this.name,
    this.email,
    this.password,
    this.username,
  });

  UserNew.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
      email = json['email'];
      password = json['password'];
      username = json['username'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (name != null) {
      map['name'] = name;
    }
    if (email != null) {
      map['email'] = email;
    }
    if (password != null) {
      map['password'] = password;
    }
    if (username != null) {
      map['username'] = username;
    }

    return map;
  }

  @override
  String toString() {
    return 'UserNew{name: $name, email: $email, password: $password, username: $username}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNew &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          username == other.username;

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ password.hashCode ^ username.hashCode;
}
