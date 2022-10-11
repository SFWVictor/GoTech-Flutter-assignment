import 'package:gotech_questionnaire/data/questions/multiple_choice/question.dart';
import 'package:gotech_questionnaire/data/questions/open/question.dart';

abstract class Question {
  static const String typeKeyName = "type";

  final bool isRequired;

  Question(this.isRequired);

  factory Question.fromJson(Map<String, dynamic> json) {
    var questionType = json[typeKeyName];

    switch (questionType as String) {
      case MultipleChoiceQuestion.questionType:
        return MultipleChoiceQuestion.fromJson(json);
      case OpenQuestion.questionType:
        return OpenQuestion.fromJson(json);
      default:
        throw StateError(
            "Unknown type $questionType when deserializing type ${(Question).toString()}.");
    }
  }

  Map<String, dynamic> toJson();
}
