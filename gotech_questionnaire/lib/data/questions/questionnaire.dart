import 'question.dart';

class Questionnaire {
  Questionnaire({
    required this.title,
    required this.subtitle,
    required this.questions,
  });

  String title;
  String subtitle;
  List<Question> questions;

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        title: json["title"],
        subtitle: json["subtitle"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}
