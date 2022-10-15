import 'package:gotech_questionnaire/bloc/models/multiple_choice_question.dart';
import 'package:gotech_questionnaire/bloc/models/open_question.dart';
import 'package:gotech_questionnaire/data/answers/questionnaire_answers.dart';
import 'package:gotech_questionnaire/data/answers/types/open.dart';

import '../data/answers/answer.dart';
import '../data/answers/types/multiple_choice.dart';
import '../data/questions/questionnaire.dart';
import 'models/question.dart';

class QuestionnaireModel {
  final Questionnaire questionnaireData;
  final List<QuestionModel> questions;

  QuestionnaireModel(this.questionnaireData)
      : questions = questionnaireData.questions
            .map((question) => QuestionModel.fromData(question))
            .whereType<QuestionModel>()
            .toList();

  bool get areAnswersValid =>
      questions.every((question) => question.isAnswerValid);

  void dispose() {
    for (var question in questions) {
      question.dispose();
    }
  }

  QuestionnaireAnswers? getAnswers() {
    if (!areAnswersValid) return null;

    return QuestionnaireAnswers(
        questionnaireId: questionnaireData.id,
        answers: questions
            .map((q) {
              switch (q.runtimeType) {
                case OpenQuestionModel:
                  var model = q as OpenQuestionModel;
                  return OpenAnswer(model.data.id, model.answer);
                case MultipleChoiceQuestionModel:
                  var model = q as MultipleChoiceQuestionModel;
                  return MultipleChoiceAnswer(model.data.id, model.answer);
              }

              return null;
            })
            .whereType<Answer>()
            .toList());
  }
}

class QuestionnaireData {
  final int id;
  final String title;
  final String subtitle;

  QuestionnaireData(Questionnaire questionnaire)
      : id = questionnaire.id,
        title = questionnaire.title,
        subtitle = questionnaire.subtitle;
}
