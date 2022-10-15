import '../answer.dart';

class MultipleChoiceAnswer extends Answer {
  final String? body;

  MultipleChoiceAnswer(int questionId, this.body) : super(questionId);

  @override
  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'body': body,
      };
}
