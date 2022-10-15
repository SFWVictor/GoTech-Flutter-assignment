import '../answer.dart';

class OpenAnswer extends Answer {
  final String? body;

  OpenAnswer(int questionId, this.body) : super(questionId);

  @override
  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'body': body,
      };
}
