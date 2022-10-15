import 'package:flutter/material.dart';
import '../../../bloc/models/questions/open_question.dart';
import '../../questionnaire_tile.dart';
import '../../question_title.dart';

class OpenQuestion extends StatefulWidget {
  final OpenQuestionModel question;

  const OpenQuestion({Key? key, required this.question}) : super(key: key);

  @override
  _OpenQuestionState createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  final TextEditingController _textEditingController = TextEditingController();

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
                questionText: widget.question.data.title,
                isRequired: widget.question.data.isRequired,
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: StreamBuilder<String?>(
              stream: widget.question.answerStream,
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.data == null) {
                  _textEditingController.clear();
                }

                return TextField(
                  controller: _textEditingController,
                  onChanged: (text) => widget.question.onAnswerChanged(text),
                  decoration: InputDecoration(
                      hintText: widget.question.data.hint,
                      border: const UnderlineInputBorder(),
                      errorText: snapshot.error?.toString()),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
