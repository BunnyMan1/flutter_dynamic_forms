import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/utilities/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  helpersTest();
}

/// Test cases of helper functions in [helpers.dart](../lib/src/utilities/helpers.dart)
void helpersTest() {
  group('hexStringToColorConverter Test', () {
    hexStringToColorConverterTest();
  });

  group('formattedDate Test', () {
    formattedDateTest();
  });
}

/// Test cases to check whether a given string is converted to color or not.
void hexStringToColorConverterTest() {
  // ------ Success Cases --------
  group('Success Cases', () {
    test('Case 1', () {
      String case1 = "ffffff";
      expect(hexStringToColorConverter(case1), const Color(0xffffffff));
    });
    // FormatException: Invalid radix-16 number
  });

  // ------ Error Cases --------
  // Error cases occur where Input String :
  // * length is '< 6' or '> 6'.
  // * is not a hex code.
  group('Error Cases (Length)', () {
    test('Case 1', () {
      String case1 = "0";
      expect(
        () => throw hexStringToColorConverter(case1),
        throwsA(
          'Badly formatted hex color code. Length of the hex code should be 6.',
        ),
      );
    });
    test('Case 2', () {
      String case2 = "00";
      expect(
        () => throw hexStringToColorConverter(case2),
        throwsA(
          'Badly formatted hex color code. Length of the hex code should be 6.',
        ),
      );
    });
    test('Case 3', () {
      String case3 = "000";
      expect(
        () => throw hexStringToColorConverter(case3),
        throwsA(
          'Badly formatted hex color code. Length of the hex code should be 6.',
        ),
      );
    });
    test('Case 4', () {
      String case4 = "00000";
      expect(
        () => throw hexStringToColorConverter(case4),
        throwsA(
          'Badly formatted hex color code. Length of the hex code should be 6.',
        ),
      );
    });
    test('Case 5', () {
      String case5 = "00000";
      expect(
        () => throw hexStringToColorConverter(case5),
        throwsA(
          'Badly formatted hex color code. Length of the hex code should be 6.',
        ),
      );
    });
    test('Case 7', () {
      String case7 = "0000000";
      expect(
        () => throw hexStringToColorConverter(case7),
        throwsA(
          'Badly formatted hex color code. Length of the hex code should be 6.',
        ),
      );
    });
  });

  // FORMAT EXCEPTION.
  group('Error Cases (Hexcode)', () {
    test('Case 1', () {
      String case1 = "fffffg";
      //TODO(Testing): [Unimportant]Check if there is a way to test a specific format exception error.
      expect(
        () => throw hexStringToColorConverter(case1),
        throwsFormatException,
      );
      // throwsFormatException is equivalent of (TypeMatcher<FormatException>),
    });
  });
}

void formattedDateTest() {
  // ------ Success Cases --------
  group('Success Cases', () {
    test('Case 1', () {
      DateTime case1 = DateTime.now();
      expect(formattedDate(case1), '7 Sep 2022');
    });
  });

  // ------ Error Cases --------
  // Error cases occur :
}
