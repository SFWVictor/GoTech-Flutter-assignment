import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'question.dart';
import '../../../data/questions/multiple_choice/question.dart';

class MultipleChoiceQuestionModel extends QuestionModel {
  final MultipleChoiceQuestion _question;
  final StreamController<String?> _answerController =
      BehaviorSubject<String?>();
  late StreamTransformer<String?, String?> _validateAnswer;

  Function(String?) get onAnswerChanged => _answerController.sink.add;
  Stream<String?> get answerStream =>
      _answerController.stream.transform(_validateAnswer);

  String? answer;
  late bool _isAnswerValid;

  @override
  bool get isAnswerValid => _isAnswerValid;

  @override
  QuestionType get questionType => QuestionType.multipleChoice;

  set isAnswerValid(bool isAnswerValid) {
    _isAnswerValid = isAnswerValid;
  }

  @override
  MultipleChoiceQuestion get data => _question;

  MultipleChoiceQuestionModel(this._question) : super(_question) {
    _isAnswerValid = getIsAnswerValid();
    _validateAnswer = StreamTransformer<String?, String?>.fromHandlers(
        handleData: (answer, sink) {
      this.answer = answer;
      _isAnswerValid = getIsAnswerValid();

      if (_isAnswerValid) {
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
  void clear() {
    onAnswerChanged(null);
  }

  @override
  void dispose() {
    _answerController.close();
  }
}
