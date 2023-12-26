import 'package:example/models/quiz_item.dart';
import 'package:flutter/material.dart';
import 'package:quick_quiz_view/quick_quiz_view.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuizIndex = 0;
  final Map<int, int> userAnswers = {};

  final quizData = [
    QuizItem(
      title: 'What is the capital of Japan?',
      option1: 'Tokyo',
      option2: 'Beijing',
      option3: 'Seoul',
      option4: 'Bangkok',
      correctOption: 1,
    ),
    QuizItem(
      title: 'Which planet is known as the Red Planet?',
      option1: 'Earth',
      option2: 'Mars',
      option3: 'Jupiter',
      option4: 'Venus',
      correctOption: 2,
    ),
    QuizItem(
      title: 'Who wrote "Romeo and Juliet"?',
      option1: 'William Shakespeare',
      option2: 'Jane Austen',
      option3: 'Charles Dickens',
      option4: 'Mark Twain',
      correctOption: 1,
    ),
    QuizItem(
      title: 'What is the largest mammal on Earth?',
      option1: 'Elephant',
      option2: 'Blue Whale',
      option3: 'Giraffe',
      option4: 'Gorilla',
      correctOption: 2,
    ),
    QuizItem(
      title: 'Which country is known as the Land of the Rising Sun?',
      option1: 'China',
      option2: 'Japan',
      option3: 'South Korea',
      option4: 'Vietnam',
      correctOption: 2,
    ),
  ];

  int _prepareQuizResult() {
    int correctAnswers = 0;
    for (int i = 0; i < quizData.length; i++) {
      final givenAnswer = userAnswers[i] ?? 0;
      if (givenAnswer == quizData[i].correctOption) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  void _showResultSnackbar(BuildContext context, int correctAnswers) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your Score: $correctAnswers'),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuizIndex = 0;
      userAnswers.clear();
    });
  }

  void _handleNextPressed() {
    if (currentQuizIndex == quizData.length - 1) {
      final correctAnsweres = _prepareQuizResult();
      _showResultSnackbar(context, correctAnsweres);
    } else {
      setState(() {
        currentQuizIndex++;
      });
    }
  }

  bool _canNavigateToPrevious() {
    return currentQuizIndex > 0 && currentQuizIndex < quizData.length - 1;
  }

  void _handlePreviousPressed() {
    setState(() {
      currentQuizIndex--;
    });
  }

  void _handleOptionSelected(int value) {
    userAnswers[currentQuizIndex] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Screen'),
      ),
      body: QuickQuizView(
        title: quizData[currentQuizIndex].title,
        option1: quizData[currentQuizIndex].option1,
        option2: quizData[currentQuizIndex].option2,
        option3: quizData[currentQuizIndex].option3,
        option4: quizData[currentQuizIndex].option4,
        onNextPressed: () => _handleNextPressed(),
        onPreviousPressed:
            _canNavigateToPrevious() ? () => _handlePreviousPressed() : null,
        onOptionSelected: (value) => _handleOptionSelected(value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetQuiz,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
