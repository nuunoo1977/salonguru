extension Ab on Map<int, dynamic> {
  Map<String, dynamic> keyToString() {
    return map((key, value) => MapEntry(key.toString(), value));
  }
}

extension Ba on Map<String, dynamic> {
  Map<int, int> toInt() {
    return map((key, value) => MapEntry(int.parse(key), int.parse("$value")));
  }
}
