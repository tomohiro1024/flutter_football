import 'package:flutter/widgets.dart';
import 'package:flutter_footbool/models/questions.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<Question> _questions = questionData
      .map((question) => Question(
            id: question["id"],
            question: question["question"],
            options: question["options"],
            answer: question["answer_index"],
          ))
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int? _correctAnswer;
  int? get correctAnswer => _correctAnswer;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAnswer = 0;
  int get numOfCorrectAns => _numOfCorrectAnswer;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    _animationController.forward();

    super.onInit();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    // 答えの番号
    _correctAnswer = question.answer;
    // ユーザーが選択した番号
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      // 正解した回数
      _numOfCorrectAnswer++;
    }

    _animationController.stop();
    update();
  }
}
