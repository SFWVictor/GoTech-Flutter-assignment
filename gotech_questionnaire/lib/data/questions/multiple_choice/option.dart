import 'option_closed.dart';
import 'option_open.dart';

abstract class Option {
  static const String typeKeyName = "type";

  Option();

  factory Option.fromJson(Map<String, dynamic> json) {
    var answerType = json[typeKeyName];
    switch (answerType as String) {
      case MultipleChoiceOptionClosed.answerType:
        return MultipleChoiceOptionClosed.fromJson(json);
      case MultipleChoiceOptionOpen.answerType:
        return MultipleChoiceOptionOpen.fromJson(json);
      default:
        throw StateError(
            "Unknown type $answerType when deserializing type ${(Option).toString()}.");
    }
  }

  Map<String, dynamic> toJson();
}
