import '../question.dart';

class OpenQuestion extends Question {
  static const questionType = "open";

  OpenQuestion({
    isRequired,
    required this.title,
    required this.hint,
  }) : super(isRequired);

  final String title;
  final String hint;

  factory OpenQuestion.fromJson(Map<String, dynamic> json) => OpenQuestion(
        title: json["title"],
        isRequired: json["required"],
        hint: json["hint"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "title": title,
        "type": questionType,
        "required": isRequired,
        "hint": hint,
      };
}
