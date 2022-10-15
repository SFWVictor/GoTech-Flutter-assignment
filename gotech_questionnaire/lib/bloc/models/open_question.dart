import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'question.dart';
import '../../data/questions/open/question.dart';

class OpenQuestionModel extends QuestionModel {
  final OpenQuestion _question;
  final StreamController<String> _answerController = BehaviorSubject<String>();
  late StreamTransformer<String, String> _validateAnswer;

  Function(String) get onAnswerChanged => _answerController.sink.add;
  Stream<String> get answerStream =>
      _answerController.stream.transform(_validateAnswer);

  String? answer;
  late bool _isAnswerValid;

  @override
  bool get isAnswerValid => _isAnswerValid;

  set isAnswerValid(bool isAnswerValid) {
    _isAnswerValid = isAnswerValid;
  }

  @override
  OpenQuestion get data => _question;

  OpenQuestionModel(this._question) : super(_question) {
    _isAnswerValid = getIsAnswerValid();
    _validateAnswer = StreamTransformer<String, String>.fromHandlers(
        handleData: (answer, sink) {
      this.answer = answer;
      isAnswerValid =
          _question.isRequired && answer.isNotEmpty || !_question.isRequired;

      if (isAnswerValid) {
        sink.add(answer);
      } else {
        sink.addError('This question is required.');
      }
    });
  }

  bool getIsAnswerValid() =>
      _question.isRequired && answer != null && answer!.isNotEmpty ||
      !_question.isRequired;

  @override
  void dispose() {
    _answerController.close();
  }
}
