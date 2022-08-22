/// `ValidationResult`
class ValidationResult {
  // Constructor
  ValidationResult({
    required this.componentName,
    required this.type,
    required this.value,
    required this.errors,
  });

  /// Component name of the validation
  final String componentName;

  /// Component type of the validation
  final String type;

  /// Validation result
  final dynamic value;

  /// Error messages after validation failed.
  final List<Map<String, dynamic>> errors;
  
  // Converts the validation result to a map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'componentName': componentName,
      'type': type,
      'value': value,
      'errors': errors,
    };
  }
}
