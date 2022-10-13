import 'package:flutter/material.dart';
import 'package:gotech_questionnaire/data/questions/multiple_choice/option_closed.dart';
import 'package:gotech_questionnaire/ui/question_title.dart';
import '../../../data/questions/multiple_choice/option_open.dart';
import '../../../data/questions/multiple_choice/option.dart';
import '../../questionnaire_tile.dart';
import 'multiple_choice_option_open.dart' as option_open;
import 'multiple_choice_option_closed.dart' as option_closed;
import '../../../data/questions/multiple_choice/question.dart' as model;

class MultipleChoiceQuestion extends StatefulWidget {
  final model.MultipleChoiceQuestion question;

  const MultipleChoiceQuestion({Key? key, required this.question})
      : super(key: key);

  @override
  _MultipleChoiceQuestionState createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  String _answer = '';

  @override
  Widget build(BuildContext context) {
    var columnTiles = <Widget>[];
    columnTiles.add(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: QuestionTitle(
            questionText: widget.question.title,
            isRequired: widget.question.isRequired)));
    columnTiles.addAll(widget.question.options.map((option) {
      switch (option.runtimeType) {
        case MultipleChoiceOptionOpen:
          var optionOpen = option as MultipleChoiceOptionOpen;
          return option_open.MultipleChoiceOptionOpen(
            value: optionOpen.caption,
            groupValue: _answer,
            onChanged: (value) => setState(() => _answer = value!),
          );

        case MultipleChoiceOptionClosed:
          var optionClosed = option as MultipleChoiceOptionClosed;
          return option_closed.MultipleChoiceOptionClosed(
            value: optionClosed.caption,
            groupValue: _answer,
            onChanged: (value) => setState(() => _answer = value!),
          );

        default:
          throw Exception('Unrecognized option type.');
      }
    }));

    return QuestionnaireTile(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnTiles,
    ));
  }
}
