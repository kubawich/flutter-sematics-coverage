# Check for Semantics Widget in Flutter Code

## Description

This GitHub Action checks if all Dart classes in a Flutter project are wrapped in a Semantics widget for accessibility. It provides detailed feedback indicating which classes in which files lack a Semantics widget.

### Author

Jakub Wichlinski @kubawich

### Usage

To use this action, you can create a .github/workflows directory in your repository if it doesn't exist, and then create a new YAML file inside it (e.g., check_semantics_workflow.yml). Add the following content to that YAML file:

```yaml
name: Check for Semantics Widget

on:
  push:
    branches:
      - main

jobs:
  check:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run Check for Semantics Widget Action
        uses: kubawich/flutter-sematics-coverage@main
```

### Predicted Output

The action will traverse all .dart files in the specified working directory and will check if each Dart class contains a Semantics widget. The output will be detailed, specifying which classes in which files lack a Semantics widget.

Example Output

```kotlin

No Semantics widget found in class AuthView in file ./lib/screens/AuthView.dart
Semantics widget found in class LoginButtonsMode in file ./lib/screens/LoginButtonsMode.dart
No Semantics widget found in class LoginMode in file ./lib/screens/LoginMode.dart
```

In this example, the AuthView and LoginMode classes in their respective files are missing a Semantics widget, while the LoginButtonsMode class includes one.

### License

MIT
