import 'package:flutter/material.dart';

class MultipleChoiceOptionClosed extends StatelessWidget {
  final String value;
  final String? groupValue;
  final void Function(String?) onChanged;

  const MultipleChoiceOptionClosed(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value),
      leading: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
