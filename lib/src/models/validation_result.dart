class ValidationResult {
  final String componentName;
  final String type;
  final dynamic value;
  final List<Map<String, dynamic>> errors;
  ValidationResult({
    required this.componentName,
    required this.type,
    required this.value,
    required this.errors,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'componentName': componentName,
      'type': type,
      'value': value,
      'errors': errors,
    };
  }
}
