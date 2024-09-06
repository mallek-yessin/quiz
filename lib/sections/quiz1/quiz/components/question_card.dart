import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Questions.dart';
import '../../constants.dart';
import '../../question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required Key key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              key: Key('option_$index'), // Providing the required key
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index, context),
            ),
          ),
        ],
      ),
    );
  }
}
