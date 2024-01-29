import 'package:flutter/material.dart';

import '../../../models/Questions.dart';
import 'body.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
  });

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
            sample_data[0]["question"],
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          Option(),
          Option(),
          Option(),
          Option(),
        ],
      ),
    );
  }
}