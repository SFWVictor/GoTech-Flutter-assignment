import 'dart:async';

import 'package:gotech_questionnaire/data/answers/questionnaire_answers.dart';

import '../data/api_client.dart';
import '../data/questions/questionnaire.dart';
import 'bloc.dart';

class QuestionnaireBloc implements Bloc {
  final _client = ApiClient();
  final _questionnaireController = StreamController();
  final _submitController = StreamController();
  Sink get search => _questionnaireController.sink;
  Sink get submit => _submitController.sink;
  late Stream<Questionnaire?> questionnaireStream;
  late Stream<bool> submitStream;

  QuestionnaireBloc() {
    questionnaireStream = _questionnaireController.stream
        .asyncMap((query) => _client.getQuestionnaire());
    submitStream = _submitController.stream.asyncMap((query) {
      return _client.postAnswers(query);
    });
  }

  @override
  void dispose() {
    _questionnaireController.close();
    _submitController.close();
  }
}
