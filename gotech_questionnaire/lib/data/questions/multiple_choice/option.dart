import 'option_closed.dart';
import 'option_open.dart';

abstract class MultipleChoiceOption {
  static const String typeKeyName = 'type';

  MultipleChoiceOption();

  factory MultipleChoiceOption.fromJson(Map<String, dynamic> json) {
    var answerType = json[typeKeyName];
    switch (answerType as String) {
      case MultipleChoiceOptionClosed.answerType:
        return MultipleChoiceOptionClosed.fromJson(json);
      case MultipleChoiceOptionOpen.answerType:
        return MultipleChoiceOptionOpen.fromJson(json);
      default:
        throw Exception(
            'Unknown type $answerType when deserializing type ${(MultipleChoiceOption).toString()}.');
    }
  }

  Map<String, dynamic> toJson();
}
