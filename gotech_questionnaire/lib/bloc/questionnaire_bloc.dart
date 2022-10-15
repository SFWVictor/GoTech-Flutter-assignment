import 'dart:async';
import 'package:gotech_questionnaire/bloc/questionnaire_model.dart';
import '../data/api_client.dart';
import 'bloc.dart';

class QuestionnaireBloc implements Bloc {
  final _client = ApiClient();
  final _questionnaireController = StreamController();
  final _submitController = StreamController();
  Sink get search => _questionnaireController.sink;
  Sink get submit => _submitController.sink;
  late Stream<QuestionnaireModel?> questionnaireStream;
  late Stream<bool> submitStream;

  QuestionnaireModel? _lastModel;

  QuestionnaireBloc() {
    questionnaireStream =
        _questionnaireController.stream.asyncMap(_mapResponseToModel);
    submitStream = _submitController.stream.asyncMap((query) {
      if (_lastModel != null) {
        var answers = _lastModel!.getAnswers();
        return answers != null
            ? _client.postAnswers(answers)
            : Future.value(false);
      }

      return Future.value(false);
    });
  }

  @override
  void dispose() {
    _questionnaireController.close();
    _submitController.close();
    _lastModel?.dispose();
  }

  Future<QuestionnaireModel?> _mapResponseToModel(dynamic query) async {
    var response = await _client.getQuestionnaire();

    _lastModel?.dispose();
    _lastModel = response == null ? null : QuestionnaireModel(response);

    return _lastModel;
  }
}
