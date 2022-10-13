import 'option.dart';

class MultipleChoiceOptionOpen extends MultipleChoiceOption {
  static const answerType = 'open';

  final String caption;

  MultipleChoiceOptionOpen({required this.caption});

  factory MultipleChoiceOptionOpen.fromJson(Map<String, dynamic> json) =>
      MultipleChoiceOptionOpen(
        caption: json['caption'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'type': answerType,
        'caption': caption,
      };
}
