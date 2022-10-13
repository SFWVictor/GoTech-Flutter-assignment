import 'package:flutter/material.dart';

class QuestionTitle extends StatelessWidget {
  static const requiredQuestionHint = ' *';

  final String questionText;
  final bool isRequired;

  const QuestionTitle(
      {super.key, required this.questionText, required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            style: const TextStyle(fontSize: 22, color: Colors.black),
            children: [
              TextSpan(text: questionText),
              if (isRequired)
                const TextSpan(
                    text: requiredQuestionHint,
                    style: TextStyle(color: Colors.red))
            ]));
  }
}
