import 'package:flutter/material.dart';
import '../../../bloc/models/answers/multiple_choice/no_answer.dart';
import '../../../bloc/models/answers/multiple_choice/answer.dart';
import '../../../bloc/models/answers/multiple_choice/closed_answer.dart';
import '../../../data/questions/multiple_choice/option.dart';
import '../../../data/questions/multiple_choice/option_closed.dart';
import '../../../ui/question_title.dart';
import '../../../bloc/models/questions/multiple_choice_question.dart';
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

    columnTiles.add(StreamBuilder<MultipleChoiceAnswerModel>(
      stream: widget.question.answerStream,
      builder: (context, snapshot) {
        var groupValue = snapshot.data ?? MultipleChoiceNoAnswerModel();

        var options = widget.question.data.options.map((option) {
          switch (option.optionType) {
            case MultipleChoiceOptionType.open:
              var optionOpen = option as MultipleChoiceOptionOpen;
              return option_open.MultipleChoiceOptionOpen(
                caption: optionOpen.caption,
                value: optionOpen.caption,
                groupValue: groupValue,
                onChanged: (answer) => widget.question
                    .onAnswerChanged(answer ?? MultipleChoiceNoAnswerModel()),
              );

            case MultipleChoiceOptionType.closed:
              var optionClosed = option as MultipleChoiceOptionClosed;
              return option_closed.MultipleChoiceOptionClosed(
                caption: optionClosed.caption,
                value: MultipleChoiceClosedAnswerModel(optionClosed.caption),
                groupValue: groupValue,
                onChanged: (answer) => widget.question
                    .onAnswerChanged(answer ?? MultipleChoiceNoAnswerModel()),
              );
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
