import '../question.dart';

class OpenQuestion extends Question {
  static const questionType = 'open';

  OpenQuestion({
    id,
    isRequired,
    required this.title,
    required this.hint,
  }) : super(id, isRequired);

  final String title;
  final String hint;

  factory OpenQuestion.fromJson(Map<String, dynamic> json) => OpenQuestion(
        id: json['id'],
        isRequired: json['required'],
        title: json['title'],
        hint: json['hint'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'required': isRequired,
        'type': questionType,
        'title': title,
        'hint': hint,
      };
}
