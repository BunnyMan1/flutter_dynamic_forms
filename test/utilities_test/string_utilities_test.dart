import 'package:flutter_dynamic_forms/src/utilities/string_utilities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  stringUtilitiesTest();
}

/// Test cases of String utility functions in [string_utilities.dart](../lib/src/utilities/string_utilities.dart)
void stringUtilitiesTest() {
  String expectedOutput = "First Name";

  // ------ Snake Cases to Title Case --------
  group('Snake to title', () {
    /// Expected Output is constant in this test group
    test('Case 1', () {
      String case1 = "first_name";
      expect(toTitleCase(case1), expectedOutput);
    });
    test('Case 2', () {
      String case2 = "First_name";
      expect(toTitleCase(case2), expectedOutput);
    });
    test('Case 3', () {
      String case3 = "first_Name";
      expect(toTitleCase(case3), expectedOutput);
    });
    test('Case 4', () {
      String case4 = "First_Name";
      expect(toTitleCase(case4), expectedOutput);
    });
  });

  // ------ Hyphen Cases to Title Case --------
  group('Hyphen to Title', () {
    test('Case 1', () {
      String case1 = "first-name";
      expect(toTitleCase(case1), expectedOutput);
    });
    test('Case 2', () {
      String case2 = "First-name";
      expect(toTitleCase(case2), expectedOutput);
    });
    test('Case 3', () {
      String case3 = "first-Name";
      expect(toTitleCase(case3), expectedOutput);
    });
    test('Case 4', () {
      String case4 = "First-Name";
      expect(toTitleCase(case4), expectedOutput);
    });
  });

  // ------ Spaced Cases to Title Case --------
  group('Spaced to Title case', () {
    test('Case 1', () {
      String case1 = "first name";
      expect(toTitleCase(case1), expectedOutput);
    });
    test('Case 2', () {
      String case2 = "First name";
      expect(toTitleCase(case2), expectedOutput);
    });
    test('Case 3', () {
      String case3 = "first Name";
      expect(toTitleCase(case3), expectedOutput);
    });
    test('Case 4', () {
      String case4 = "First Name";
      expect(toTitleCase(case4), expectedOutput);
    });
  });

  // ------ Camel Cases to Title Case --------
  group('Camel case to title case', () {
    test('Case 1', () {
      String case1 = "firstName";
      expect(toTitleCase(case1), expectedOutput);
    });
    test('Case 2', () {
      String case2 = "FirstName";
      expect(toTitleCase(case2), expectedOutput);
    });
    test('Case 3', () {
      String case3 = "Firstname";
      expect(toTitleCase(case3), "Firstname");
    });
    test('Case 4', () {
      String case4 = "firstname";
      expect(toTitleCase(case4), "Firstname");
    });
  });

  // ------ Pascal Cases to Title Case --------
  group('Pascal to Title', () {
    test('Case 1', () {
      String case1 = "FirstName";
      expect(toTitleCase(case1), expectedOutput);
    });
    test('Case 2', () {
      String case2 = "FirstName";
      expect(toTitleCase(case2), expectedOutput);
    });
    test('Case 3', () {
      String case3 = "first Name";
      expect(toTitleCase(case3), expectedOutput);
    });
    test('Case 4', () {
      String case4 = "First Name";
      expect(toTitleCase(case4), expectedOutput);
    });
  });
}
