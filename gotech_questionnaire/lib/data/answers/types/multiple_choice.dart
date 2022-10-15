import '../../../bloc/models/answers/multiple_choice/closed_answer.dart';
import '../../../bloc/models/answers/multiple_choice/answer.dart';
import '../../../bloc/models/answers/multiple_choice/open_answer.dart';
import '../answer.dart';

class MultipleChoiceAnswer extends Answer {
  late String? body;

  MultipleChoiceAnswer(int questionId, MultipleChoiceAnswerModel answer)
      : super(questionId) {
    switch (answer.answerType) {
      case MultipleChoiceAnswerType.none:
        body = null;
        break;
      case MultipleChoiceAnswerType.closed:
        body = (answer as MultipleChoiceClosedAnswerModel).body;
        break;
      case MultipleChoiceAnswerType.open:
        body = (answer as MultipleChoiceOpenAnswerModel).body;
        break;
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'body': body,
      };
}
