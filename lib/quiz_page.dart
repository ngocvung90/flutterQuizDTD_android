import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'models/question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedAnswer;
  bool answered = false;

  void checkAnswer() {
    setState(() {
      answered = true;
    });
  }

  void nextQuestion() {
    setState(() {
      currentIndex++;
      selectedAnswer = null;
      answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question question = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Câu ${currentIndex + 1}/${questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              question.text,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < question.options.length; i++)
              GestureDetector(
                onTap: () {
                  if (!answered) {
                    setState(() {
                      selectedAnswer = i;
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: answered
                        ? (i == question.correctIndex
                            ? Colors.green
                            : (i == selectedAnswer ? Colors.red : Colors.grey[200]))
                        : (i == selectedAnswer ? Colors.blue[100] : Colors.grey[200]),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(question.options[i], style: TextStyle(fontSize: 18)),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedAnswer == null
                  ? null
                  : (answered ? nextQuestion : checkAnswer),
              child: Text(answered
                  ? (currentIndex == questions.length - 1 ? 'Kết thúc' : 'Câu tiếp')
                  : 'Kiểm tra'),
            ),
          ],
        ),
      ),
    );
  }
}