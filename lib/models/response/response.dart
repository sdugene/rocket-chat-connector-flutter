class Response {
  bool? success;

  Response({
    this.success = false,
  });

  Response.fromMap(Map<String, dynamic>? json) {
    if (json != null) {
      success = json['success'];
    }
  }

  Map<String, dynamic> toMap() => {
        'success': success,
      };

  @override
  String toString() {
    return 'Response{success: $success}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Response &&
          runtimeType == other.runtimeType &&
          success == other.success;

  @override
  int get hashCode => success.hashCode;
}
