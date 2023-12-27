# QuickQuizView Flutter Package

A customizable and easy-to-use Flutter package for displaying quizzes with multiple-choice questions. The QuickQuizView package is designed to simplify the implementation of quiz screens in Flutter applications. It provides a simple widget for users to select options, navigate between questions, and submit their answers.

## Installation

To use this package, add `quick_quiz_view` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  quick_quiz_view: ^0.0.1
 ```
Then, run:
```bash
$ flutter pub get
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:quick_quiz_view/quick_quiz_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: QuickQuizView(
          title: 'Example Quiz',
          option1: 'Option A',
          option2: 'Option B',
          option3: 'Option C',
          option4: 'Option D',
          onOptionSelected: (value) {
            print('Selected option: $value');
          },
          onNextPressed: () {
            print('Next button pressed');
          },
          onPreviousPressed: () {
            print('Previous button pressed');
          },
        ),
      ),
    );
  }
}
```

for more details please check the example [Quiz Screen](https://github.com/ashraful-chowdhury/quick_quiz_view/blob/main/example/lib/quiz_screen.dart)

## Features

- Supports a customizable title and four multiple-choice options.
- Automatically manages the state of selected options.
- Provides callbacks for handling user interactions such as selecting options and navigating between questions.
- Styled with a light amber background for a pleasant user experience.

## Todo
- [-] Image support for quiz
- [-] Fully customizable widgets

## Contributing
Contributions are welcome! Feel free to open issues or submit pull requests.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/ashraful-chowdhury/quick_quiz_view/blob/main/LICENSE) file for details.
