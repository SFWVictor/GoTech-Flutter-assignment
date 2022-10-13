import 'package:flutter/material.dart';

class MultipleChoiceOptionClosed extends StatelessWidget {
  final String value;
  final String groupValue;
  void Function(String?) onChanged;

  MultipleChoiceOptionClosed(
      {required this.value, required this.groupValue, required this.onChanged});

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
