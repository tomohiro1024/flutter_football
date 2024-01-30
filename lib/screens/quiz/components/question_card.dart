import 'package:flutter/material.dart';

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
          ...List.generate(
            question.options!.length,
            (index) => Option(
                text: question.options![index], index: index, press: () {}),
          ),
        ],
      ),
    );
  }
}
