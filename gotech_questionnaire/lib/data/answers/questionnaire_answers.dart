import 'answer.dart';

class QuestionnaireAnswers {
  QuestionnaireAnswers({
    required this.questionnaireId,
    required this.answers,
  });

  int questionnaireId;
  List<Answer> answers;

  Map<String, dynamic> toJson() => {
        'questionnaireId': questionnaireId,
        'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}
