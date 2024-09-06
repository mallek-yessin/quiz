import 'package:flutter/material.dart';
import '../models/live_quiz_model.dart';
import '../models/recent_quiz_model.dart';
import '../widgets/live_quiz.dart';
import '../widgets/quiz_header.dart';
import '../widgets/recent_quiz.dart';

// StatefulWidget yomken ta3meli mochkla
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int selectedindex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const QuizHeader(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 25, left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                    "Recent Quiz",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 15),
                  // Quiz Card which has an icon, title, total questions, and difficulty level
                  ...List.generate(
                    recentQuizzes.length,
                    (index) {
                      return RecentQuiz(recentQuizModel: recentQuizzes[index]);
                    },
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Live Quiz",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 15),
                  ...List.generate(
                    liveQuizzes.length,
                    (index) {
                      return LiveQuiz(liveQuizModel: liveQuizzes[index]);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
