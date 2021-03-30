class Email {
  String? address;
  bool? verified;

  Email.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      address = json['address'];
      verified = json['verified'];
    }
  }

  Map<String, dynamic> toMap() => {
        'address': address,
        'verified': verified,
      };

  @override
  String toString() {
    return 'Email{address: $address, verified: $verified}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Email &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          verified == other.verified;

  @override
  int get hashCode => address.hashCode ^ verified.hashCode;
}
