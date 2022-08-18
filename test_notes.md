# Table of contents

1. [Requirements](#requirements)
2. [Commands to Be executed](#commands-to-be-executed)

# Requirements

### Install `lcov`

#### In mac:

```shell
$ brew install lcov
```

Check if `flutter_test` sdk is added under `dev_dependencies` in `pubspec.yaml` 

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
```
If not there in your pubspec.yaml file then add it.

# Commands to be executed

### Report in command prompt

The success/failures of test cases report for

a) all the test files in test folder
```shell
flutter test --reporter=expanded;
```

b) for a particular test file
```shell
flutter test --reporter=expanded <file_name_including_path>;
```

Generate LCOV report and open the HTML coverage report

```shell
flutter test --coverage;
genhtml coverage/lcov.info -o coverage/html;
open ./coverage/html/index.html;
```