import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../answers/multiple_choice/answer.dart';
import '../answers/multiple_choice/no_answer.dart';
import '../../../data/questions/multiple_choice/question.dart';
import 'question.dart';

class MultipleChoiceQuestionModel extends QuestionModel {
  final MultipleChoiceQuestion _question;
  final StreamController<MultipleChoiceAnswerModel> _answerController =
      BehaviorSubject<MultipleChoiceAnswerModel>();
  late StreamTransformer<MultipleChoiceAnswerModel, MultipleChoiceAnswerModel>
      _validateAnswer;

  Function(MultipleChoiceAnswerModel) get onAnswerChanged =>
      _answerController.sink.add;
  Stream<MultipleChoiceAnswerModel> get answerStream =>
      _answerController.stream.transform(_validateAnswer);

  MultipleChoiceAnswerModel answer = MultipleChoiceNoAnswerModel();
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
    _validateAnswer = StreamTransformer<MultipleChoiceAnswerModel,
        MultipleChoiceAnswerModel>.fromHandlers(handleData: (answer, sink) {
      this.answer = answer;
      _isAnswerValid = getIsAnswerValid();

      if (_isAnswerValid) {
        sink.add(answer);
      } else {
        sink.addError('This question is required.');
      }
    });
  }

  bool getIsAnswerValid() {
    if (_question.isRequired) {
      switch (answer.answerType) {
        case MultipleChoiceAnswerType.none:
          return false;
        case MultipleChoiceAnswerType.closed:
        case MultipleChoiceAnswerType.open:
          return true;
      }
    }

    return true;
  }

  @override
  void clear() {
    onAnswerChanged(MultipleChoiceNoAnswerModel());
  }

  @override
  void dispose() {
    _answerController.close();
  }
}
