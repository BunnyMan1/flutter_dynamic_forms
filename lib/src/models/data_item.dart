class DataItem {
  const DataItem({
    required this.key,
    required this.value,
  });

  final String key;

  final dynamic value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataItem &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          key == other.key;

  @override
  int get hashCode => key.hashCode;
}
