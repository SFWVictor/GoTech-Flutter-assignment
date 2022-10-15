import 'package:flutter/material.dart';
import '../../../data/questions/multiple_choice/option_closed.dart';
import '../../../ui/question_title.dart';
import '../../../bloc/models/multiple_choice_question.dart';
import '../../../data/questions/multiple_choice/option_open.dart';
import '../../questionnaire_tile.dart';
import 'multiple_choice_option_open.dart' as option_open;
import 'multiple_choice_option_closed.dart' as option_closed;

class MultipleChoiceQuestion extends StatefulWidget {
  final MultipleChoiceQuestionModel question;

  const MultipleChoiceQuestion({Key? key, required this.question})
      : super(key: key);

  @override
  _MultipleChoiceQuestionState createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  @override
  Widget build(BuildContext context) {
    var columnTiles = <Widget>[];
    columnTiles.add(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: QuestionTitle(
            questionText: widget.question.data.title,
            isRequired: widget.question.data.isRequired)));

    columnTiles.add(StreamBuilder<String?>(
      stream: widget.question.answerStream,
      builder: (context, snapshot) {
        var options = widget.question.data.options.map((option) {
          switch (option.runtimeType) {
            case MultipleChoiceOptionOpen:
              var optionOpen = option as MultipleChoiceOptionOpen;
              return option_open.MultipleChoiceOptionOpen(
                value: optionOpen.caption,
                groupValue: snapshot.data,
                onChanged: (answer) => widget.question.onAnswerChanged(answer),
              );

            case MultipleChoiceOptionClosed:
              var optionClosed = option as MultipleChoiceOptionClosed;
              return option_closed.MultipleChoiceOptionClosed(
                value: optionClosed.caption,
                groupValue: snapshot.data,
                onChanged: (answer) => widget.question.onAnswerChanged(answer),
              );

            default:
              throw Exception('Unrecognized option type.');
          }
        });

        return Column(children: options.toList());
      },
    ));
    return QuestionnaireTile(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnTiles,
    ));
  }
}
