import 'package:flutter/material.dart';

class QuestionnaireTile extends StatelessWidget {
  final Widget child;
  final bool withLine;

  const QuestionnaireTile(
      {super.key, required this.child, this.withLine = false});

  @override
  build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          //TODO fix colored box at the top of titlecard
          children: [
            if (withLine)
              const SizedBox(
                height: 5,
                child: ColoredBox(
                  color: Color(0xFF6E3EC0),
                ),
              ),
            child
          ],
        ));
  }
}
