import '../answer.dart';

class OpenQuestionAnswer extends Answer {
  final String body;

  OpenQuestionAnswer(questionId, this.body) : super(questionId);

  @override
  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "body": body,
      };
}
