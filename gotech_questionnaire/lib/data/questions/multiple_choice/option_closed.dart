import 'option.dart';

class MultipleChoiceOptionClosed extends MultipleChoiceOption {
  static const answerType = 'closed';

  final String caption;

  @override
  MultipleChoiceOptionType get optionType => MultipleChoiceOptionType.closed;

  MultipleChoiceOptionClosed({
    required this.caption,
  });

  factory MultipleChoiceOptionClosed.fromJson(Map<String, dynamic> json) =>
      MultipleChoiceOptionClosed(
        caption: json['caption'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'type': answerType,
        'caption': caption,
      };
}
