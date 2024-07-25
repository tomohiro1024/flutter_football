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
        AnimationController(duration: const Duration(seconds: 20), vsync: this);

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // タイマーが切れたら次の質問へ(1問目)
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // option.dartで選択肢をタップした時の処理内容
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

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(microseconds: 250), curve: Curves.ease);

      _animationController.reset();

    // タイマーが切れたら次の質問へ(2問目以降)
      _animationController.forward().whenComplete(nextQuestion);
    }
  }
}
