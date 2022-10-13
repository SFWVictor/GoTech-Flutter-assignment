import 'package:flutter/material.dart';
import '../../questionnaire_tile.dart';
import '../../question_title.dart';
import '../../../data/questions/open/question.dart' as model;

class OpenQuestion extends StatefulWidget {
  final model.OpenQuestion question;

  const OpenQuestion({Key? key, required this.question}) : super(key: key);

  @override
  _OpenQuestionState createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  @override
  Widget build(BuildContext context) {
    return QuestionnaireTile(
        child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: QuestionTitle(
                questionText: widget.question.title,
                isRequired: widget.question.isRequired,
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: widget.question.hint,
                  border: const UnderlineInputBorder()),
            ),
          )
        ],
      ),
    ));
  }
}
