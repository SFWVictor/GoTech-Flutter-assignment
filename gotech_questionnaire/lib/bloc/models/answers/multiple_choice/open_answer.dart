import 'answer.dart';

class MultipleChoiceOpenAnswerModel extends MultipleChoiceAnswerModel {
  final String body;

  @override
  MultipleChoiceAnswerType get answerType => MultipleChoiceAnswerType.open;

  MultipleChoiceOpenAnswerModel(this.body);

  @override
  bool operator ==(Object other) {
    if (other is! MultipleChoiceOpenAnswerModel) return false;
    if (other.body != body) return false;
    return true;
  }

  @override
  int get hashCode {
    var result = 23;
    result = 43 * result + body.hashCode;
    return result;
  }
}
