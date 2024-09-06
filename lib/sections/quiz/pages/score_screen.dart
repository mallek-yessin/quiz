import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("images/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: const Color(0xFF8B94BC)),
              ),
              const Spacer(),
              Text(
                controller.getScore(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: const Color(0xFF8B94BC)),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
