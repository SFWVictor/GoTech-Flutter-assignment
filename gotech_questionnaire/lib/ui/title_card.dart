import 'package:flutter/material.dart';
import 'package:gotech_questionnaire/ui/questionnaire_tile.dart';

class TitleCard extends StatelessWidget {
  static const String hintRequired = "* Required";

  const TitleCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.hasRequiredQuestions})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool hasRequiredQuestions;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 50),
          )),
      Text(
        subtitle,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 18),
      ),
    ];

    if (hasRequiredQuestions) {
      children.add(const Divider(thickness: 0.5, color: Colors.grey));
      children.add(const Text(
        hintRequired,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.red, fontSize: 18),
      ));
    }

    return QuestionnaireTile(
        withLine: true,
        child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )));
  }
}
