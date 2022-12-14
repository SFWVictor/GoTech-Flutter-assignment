import '../question.dart';
import 'option.dart';

class MultipleChoiceQuestion extends Question {
  static const questionType = 'multipleChoice';

  MultipleChoiceQuestion({
    id,
    isRequired,
    required this.title,
    required this.options,
  }) : super(id, isRequired);

  String title;
  List<MultipleChoiceOption> options;

  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) =>
      MultipleChoiceQuestion(
        id: json['id'],
        isRequired: json['required'],
        title: json['title'],
        options: json['options'] == null
            ? List<MultipleChoiceOption>.empty()
            : List<MultipleChoiceOption>.from(
                json['options'].map((x) => MultipleChoiceOption.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'required': isRequired,
        'type': questionType,
        'title': title,
        'options': List<dynamic>.from(options.map((x) => x.toJson())),
      };
}
