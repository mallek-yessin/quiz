import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../question_controller.dart';
import './score_screen.dart';
import '../models/question_model.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.title,
  });

  @override
  State<QuestionPage> createState() => QuestionPageState();
  final String title;
}

class QuestionPageState extends State<QuestionPage> {
  late QuestionModel question;

  int currentQuestion = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestion + 1}/${sampleQuestions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: sampleQuestions.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentQuestion = index;
                  });
                },
                itemBuilder: (context, index) {
                  question = sampleQuestions[index];
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        sampleQuestions[index].question,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 25),
                      ...List.generate(
                        question.options.length,
                        (optionIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: RadioListTile(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 8.0,
                              ),
                              selectedTileColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              tileColor: Theme.of(context).colorScheme.surface,
                              title: Text(
                                question.options[optionIndex],
                              ),
                              selected: question.userAnswer ==
                                  question.options[optionIndex],
                              value: question.options[optionIndex],
                              activeColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              groupValue: question.userAnswer,
                              onChanged: (value) {
                                controller.userAnswers[index] =
                                    value.toString();
                                setState(() {
                                  sampleQuestions[index].userAnswer =
                                      value.toString();
                                });
                              },
                            ),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (currentQuestion < sampleQuestions.length - 1) {
                    setState(() {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      currentQuestion++;
                    });
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ScoreScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  currentQuestion < sampleQuestions.length - 1
                      ? "Next"
                      : "Submit",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
