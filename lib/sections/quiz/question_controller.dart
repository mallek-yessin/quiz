import 'package:get/get.dart';

import 'models/question_model.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  set numOfCorrectAns(int value) {
    _numOfCorrectAns = value;
  }

  final int _quizzLength = sampleQuestions.length;
  // int get quizzLength => this._quizzLength;

  // set quizzLength(int value) {
  //   _quizzLength = value;
  // }

  var userAnswers = [];

  createList() {
    userAnswers = List<String>.filled(_quizzLength, "");
  }

  String getScore() {
    numOfCorrectAns = 0;

    for (var i = 0; i < _quizzLength; i++) {
      var question = sampleQuestions[i];
      if (userAnswers[i] == question.answer) {
        numOfCorrectAns++;
      }
    }
    return "${numOfCorrectAns * 10}/${_quizzLength * 10}";
  }
}
