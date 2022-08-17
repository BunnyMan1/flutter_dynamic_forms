// This file consists string functions. It has different

/// This function converts CamelCase string to Title Case string.
///
/// Example:
///
/// ```dart
/// String case1 = "firstName";
/// String case2 = "FirstName";
/// ```
/// returns `First Name`
///
/// But,
///
/// ```dart
/// String case3 = "Firstname";
/// String case4 = "firstname";
/// ```
/// returns `Firstname`
///
String camelCaseToTitleCase(String s) {
  s = s
      .replaceAllMapped(
        RegExp(r'([A-Z])'),
        (match) => ' ${match.group(0)}',
      )
      .trim()
      .capitalize()
      .trim();
  return pascalToTitleCase(s);
}

/// This function converts SnakeCase string to Title Case string.
///
/// Example:
///
/// ```dart
/// String case1 = "first_name";
/// String case2 = "first_Name";
/// String case3 = "First_Name";
/// String case4 = "First_name";
/// ```
/// returns `First Name`
///
/// **NOTE:** In this function, even the hyphens are considered as underscores.
/// So, the following example will also return `First Name`.
///
/// ```dart
/// String case5 = "first-name";
/// String case6 = "first-Name";
/// String case7 = "First-Name";
/// String case8 = "First-name";
/// ```
/// returns `First Name`
///
String snakeCaseToTitleCase(String s) {
  s = s
      .replaceAllMapped(
        RegExp(r'([-|_])'),
        (match) => ' ',
      )
      .trim();
  return pascalToTitleCase(s);
}

/// This function converts Spaced string to Title Case string.
///
/// Example:
///
/// ```dart
/// String case1 = "first name";
/// String case2 = "first Name";
/// String case3 = "First Name";
/// String case4 = "First name";
/// ```
/// returns `First Name`
String pascalToTitleCase(String inputString) {
  String outputString = "";

  List<String> temp = [];

  temp = inputString.split(" ");

  for (int i = 0; i < temp.length; i++) {
    if (temp[i].isEmpty) {
      temp[i] = '';
    } else {
      temp[i] = temp[i].trim().capitalize();
    }
  }

  temp.remove('');

  outputString = temp.join(" ");

  return outputString;
}

/// This function converts any string to Title Case string.
///
/// `Input: Snake case, Pascal case, and Camel case string.`
///
/// `Output: Title Case string.`
///
String toTitleCase(String s) {
  if (s.contains(RegExp(r'([-|_])'))) {
    s = snakeCaseToTitleCase(s);
  }
  if (s.contains(RegExp(r'([A-Z])'))) {
    s = camelCaseToTitleCase(s);
  }
  if (s.contains(RegExp(r'([ ])'))) {
    s = pascalToTitleCase(s);
  } else {
    s = s.capitalize();
  }
  return s;
}

/// This is the extension function for String class.
/// 
extension StringExtensions on String {
  /// This function converts the first letter of the string to uppercase.
  String capitalize() {
    if (trim().isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
