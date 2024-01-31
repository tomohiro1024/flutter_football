import 'package:flutter/material.dart';
import 'package:flutter_footbool/controllers/question_controller.dart';
import 'package:get/get.dart';

import '../../../models/questions.dart';
import 'body.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    // QuestionControllerのメソッドを使う
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          // ここにイメージ画像を貼る予定
          // SizedBox(height: 88),
          ...List.generate(
            question.options!.length,
            (index) => Option(
              text: question.options![index],
              index: index,
              press: () => _controller.checkAnswer(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
