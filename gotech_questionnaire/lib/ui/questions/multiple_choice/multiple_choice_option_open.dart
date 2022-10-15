import 'package:flutter/material.dart';
import '../../../bloc/models/answers/multiple_choice/open_answer.dart';
import '../../../bloc/models/answers/multiple_choice/answer.dart';

class MultipleChoiceOptionOpen extends StatefulWidget {
  final String caption;
  final String value;
  final MultipleChoiceAnswerModel groupValue;
  final void Function(MultipleChoiceAnswerModel?) onChanged;

  const MultipleChoiceOptionOpen(
      {super.key,
      required this.caption,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<MultipleChoiceOptionOpen> createState() =>
      _MultipleChoiceOptionOpenState();
}

class _MultipleChoiceOptionOpenState extends State<MultipleChoiceOptionOpen> {
  final _textEditingController = TextEditingController();

  MultipleChoiceOpenAnswerModel get answerModel =>
      MultipleChoiceOpenAnswerModel(_textEditingController.text);

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
    MultipleChoiceOpenAnswerModel? groupAnswerModel;
    MultipleChoiceOpenAnswerModel localAnswerModel = answerModel;

    if (widget.groupValue.answerType == MultipleChoiceAnswerType.open) {
      groupAnswerModel = widget.groupValue as MultipleChoiceOpenAnswerModel;
    }

    var isTextFieldEnabled =
        groupAnswerModel != null && localAnswerModel == groupAnswerModel;

    return ListTile(
      title: Row(children: [
        Text(widget.caption),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextField(
                  controller: _textEditingController,
                  enabled: isTextFieldEnabled,
                )))
      ]),
      leading: Radio(
        value: localAnswerModel,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
      ),
    );
  }

  void _onTextChanged() {
    widget.onChanged(answerModel);
  }
}
