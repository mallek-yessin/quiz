// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../models/question_model.dart';
import '../models/recent_quiz_model.dart';
import '../pages/question_page.dart';
import '../question_controller.dart';

class RecentQuiz extends StatelessWidget {
  const RecentQuiz({
    super.key,
    required this.recentQuizModel,
  });
  final RecentQuizModel recentQuizModel;
  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        onTap: () {
          controller.createList();
          controller.numOfCorrectAns = 0;
          for (var question in sampleQuestions) {
            question.userAnswer = "";
          }

          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => QuestionPage(
                title: recentQuizModel.name,
              ),
            ),
          );
        },
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            recentQuizModel.icon,
            color: Colors.white,
          ),
        ),
        title: Text(recentQuizModel.name),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Ionicons.document_text_outline,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              "${recentQuizModel.answeredQuestions}/${recentQuizModel.totalQuestions} Questions",
            ),
          ],
        ),
      ),
    );
  }
}
