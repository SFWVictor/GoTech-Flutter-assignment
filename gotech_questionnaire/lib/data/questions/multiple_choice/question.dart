import '../question.dart';
import 'option.dart';

class MultipleChoiceQuestion extends Question {
  static const questionType = "multipleChoice";

  MultipleChoiceQuestion({
    isRequired,
    required this.title,
    required this.options,
  }) : super(isRequired);

  String title;
  List<Option> options;

  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) =>
      MultipleChoiceQuestion(
        title: json["title"],
        isRequired: json["required"],
        options: json["options"] == null
            ? List<Option>.empty()
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "title": title,
        "type": questionType,
        "required": isRequired,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}
