import 'package:flutter/material.dart';

class MultipleChoiceOptionOpen extends StatefulWidget {
  final String value;
  final String? groupValue;
  final void Function(String?) onChanged;

  const MultipleChoiceOptionOpen(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<MultipleChoiceOptionOpen> createState() =>
      _MultipleChoiceOptionOpenState();
}

class _MultipleChoiceOptionOpenState extends State<MultipleChoiceOptionOpen> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.removeListener(_onTextChanged);
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      controller: _textEditingController,
      enabled: _textEditingController.text == widget.groupValue,
    );

    return ListTile(
      title: Row(children: [
        Text(widget.value),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 15), child: textField))
      ]),
      leading: Radio(
        value: _textEditingController.text,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
      ),
    );
  }

  void _onTextChanged() {
    widget.onChanged(_textEditingController.text);
  }
}
