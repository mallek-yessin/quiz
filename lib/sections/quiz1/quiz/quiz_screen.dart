import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../question_controller.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => _controller.nextQuestion(context),
              child: Text("Skip")),
        ],
      ),
      body: Body(key: Key('body_widget')),
    );
  }
}
