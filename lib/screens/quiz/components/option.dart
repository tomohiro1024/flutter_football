import 'package:flutter/material.dart';
import 'package:flutter_footbool/controllers/question_controller.dart';
import 'package:get/get.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getColor() {
            // isAnsweredがtrueの場合(選択肢をタップした場合)
            if (qnController.isAnswered) {
              // 正解をタップした場合、緑色を取得
              if (index == qnController.correctAnswer) {
                return Colors.green;
              } else if // 不正解をタップした場合、赤色を取得
                  (index == qnController.selectedAnswer &&
                      qnController.selectedAnswer !=
                          qnController.correctAnswer) {
                return Colors.red;
              }
            }
            return Colors.black;
          }

          IconData getIcon() {
            return getColor() == Colors.red
                ? Icons.clear
                : Icons.radio_button_unchecked;
          }

          return InkWell(
            onTap: press,
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 290,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(color: getColor()),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1} $text",
                        style: TextStyle(color: getColor()),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: getColor() == Colors.black
                        ? null
                        : Icon(
                            getIcon(),
                            color: getColor() == Colors.black
                                ? Colors.transparent
                                : getColor(),
                          )
                    ),
              ],
            ),
          );
        });
  }
}
