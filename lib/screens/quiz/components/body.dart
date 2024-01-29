import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_footbool/controllers/question_controller.dart';
import 'package:flutter_footbool/models/Questions.dart';
import 'package:flutter_footbool/screens/quiz/components/progress_bar.dart';
import 'package:flutter_footbool/screens/quiz/components/question_card.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ProgressBar(),
            ),
            const SizedBox(height: 15),
            Text(
              "問題1",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  "1/10",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                itemCount: _questionController.questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.questions[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
