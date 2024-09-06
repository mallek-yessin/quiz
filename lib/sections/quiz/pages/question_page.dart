// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../question_controller.dart';
import './score_screen.dart';

import '../../entry.dart';
import '../models/question_model.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<QuestionPage> createState() => QuestionPageState();
  final String title;
}

class QuestionPageState extends State<QuestionPage> {
  String c = '';
  String x = '';

  int currentQuestion = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
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
                    x = "";
                  });
                },
                itemBuilder: (context, index) {
                  final question = sampleQuestions[index];
                  c = question.answer;
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
                                setState(() {
                                  sampleQuestions[index].userAnswer =
                                      value.toString();
                                });
                                x = question.userAnswer;
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
                  if (x == c) _controller.numOfCorrectAns++;

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
