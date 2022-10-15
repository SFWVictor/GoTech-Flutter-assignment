import 'package:flutter/material.dart';

class QuestionnaireTile extends StatelessWidget {
  final Widget child;
  final bool withLine;

  const QuestionnaireTile({super.key, required this.child, this.withLine = false});

  @override
  build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: child,
          ),
          if (withLine)
            const Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: SizedBox(
                    child: ColoredBox(
                      color: Color(0xFF6E3EC0),
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
