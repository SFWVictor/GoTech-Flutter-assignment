import 'package:flutter/material.dart';
import '../../../bloc/models/answers/multiple_choice/answer.dart';
import '../../../bloc/models/answers/multiple_choice/closed_answer.dart';

class MultipleChoiceOptionClosed extends StatelessWidget {
  final String caption;
  final MultipleChoiceClosedAnswerModel value;
  final MultipleChoiceAnswerModel groupValue;
  final void Function(MultipleChoiceAnswerModel?) onChanged;

  const MultipleChoiceOptionClosed(
      {super.key,
      required this.caption,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value.body),
      leading: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
