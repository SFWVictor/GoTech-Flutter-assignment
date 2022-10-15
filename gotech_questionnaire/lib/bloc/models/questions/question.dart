import 'multiple_choice_question.dart';
import 'open_question.dart';
import '../../../data/questions/question.dart';
import '../../../data/questions/multiple_choice/question.dart';
import '../../../data/questions/open/question.dart';

abstract class QuestionModel {
  Question get data;
  bool get isAnswerValid;
  QuestionType get questionType;

  QuestionModel(Question question);

  static QuestionModel? fromData(Question question) {
    switch (question.runtimeType) {
      case OpenQuestion:
        return OpenQuestionModel(question as OpenQuestion);
      case MultipleChoiceQuestion:
        return MultipleChoiceQuestionModel(question as MultipleChoiceQuestion);
    }

    return null;
  }

  void clear();
  void dispose();
}

enum QuestionType { open, multipleChoice }
