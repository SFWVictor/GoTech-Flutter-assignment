import 'package:flutter/material.dart';
import 'package:gotech_questionnaire/bloc/questionnaire_bloc.dart';
import 'package:gotech_questionnaire/ui/questions/open/open_question.dart';
import 'package:gotech_questionnaire/ui/questions/multiple_choice/multiple_choice.dart';
import 'package:gotech_questionnaire/ui/title_card.dart';

import 'bloc/bloc_provider.dart';
import 'pages/questionnaire.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionnaireBloc>(
        bloc: QuestionnaireBloc(),
        child: MaterialApp(
            title: 'GoTech demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Color(0xFFF2EEF7)),
            home: QuestionnairePage(title: 'Questionnaire')));
  }
}
