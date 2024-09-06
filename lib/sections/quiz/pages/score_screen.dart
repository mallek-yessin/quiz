import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../models/question_model.dart';
import '../question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("images/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Color(0xFF8B94BC)),
              ),
              Spacer(),
              Text(
                _controller.getScore(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Color(0xFF8B94BC)),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
