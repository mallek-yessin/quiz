import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  set numOfCorrectAns(int value) {
    _numOfCorrectAns = value;
  }
}
