import 'option.dart';

class MultipleChoiceOptionClosed extends Option {
  static const answerType = "closed";

  final String caption;

  MultipleChoiceOptionClosed({
    required this.caption,
  });

  factory MultipleChoiceOptionClosed.fromJson(Map<String, dynamic> json) =>
      MultipleChoiceOptionClosed(
        caption: json["caption"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "type": answerType,
        "caption": caption,
      };
}
