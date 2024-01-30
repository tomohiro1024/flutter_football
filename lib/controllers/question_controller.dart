import 'package:flutter/widgets.dart';
import 'package:flutter_footbool/models/questions.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  final List<Question> _questions = questionData.map((question) => Question(
    id: question["id"],
    question: question["question"],
    options: question["options"],
    answer: question["answer_index"],
  )).toList();

  List<Question> get questions => _questions;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    _animationController.forward();

    super.onInit();
  }
}
