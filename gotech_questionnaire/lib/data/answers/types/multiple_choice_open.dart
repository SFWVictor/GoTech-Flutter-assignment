import '../answer.dart';

class MultipleChoiceOpenAnswer extends Answer {
  final String body;

  MultipleChoiceOpenAnswer(questionId, this.body) : super(questionId);

  @override
  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "body": body,
      };
}
