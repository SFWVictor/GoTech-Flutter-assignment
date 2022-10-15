import 'answer.dart';

class MultipleChoiceNoAnswerModel extends MultipleChoiceAnswerModel {
  @override
  MultipleChoiceAnswerType get answerType => MultipleChoiceAnswerType.none;

  @override
  bool operator ==(Object other) {
    if (other is! MultipleChoiceNoAnswerModel) return false;
    return true;
  }

  @override
  int get hashCode {
    var result = 23;
    return result;
  }
}
