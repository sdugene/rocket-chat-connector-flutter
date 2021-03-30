class MessageAttachmentField {
  bool? short;
  String? title;
  String? value;

  MessageAttachmentField({
    this.short,
    this.title,
    this.value,
  });

  MessageAttachmentField.fromMap(Map<String, dynamic> json) {
    if (json != null) {
      short = json['short'];
      title = json['title'];
      value = json['value'];
    }
  }

  Map<String, dynamic> toMap() => {
        'short': short,
        'title': title,
        'value': value,
      };

  @override
  String toString() {
    return 'MessageAttachmentField{short: $short, title: $title, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAttachmentField &&
          runtimeType == other.runtimeType &&
          short == other.short &&
          title == other.title &&
          value == other.value;

  @override
  int get hashCode => short.hashCode ^ title.hashCode ^ value.hashCode;
}
