import 'package:flutter/material.dart';
import 'quiz_page.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game',
      home: QuizPage(),
    );
  }
}