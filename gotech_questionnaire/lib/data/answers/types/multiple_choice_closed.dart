import '../answer.dart';

class MultipleChoiceClosedAnswer extends Answer {
  final int answerId;

  MultipleChoiceClosedAnswer(questionId, this.answerId) : super(questionId);

  @override
  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "answerId": answerId,
      };
}
