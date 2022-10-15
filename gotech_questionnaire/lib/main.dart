import 'package:flutter/material.dart';

import 'bloc/questionnaire_bloc.dart';
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
                scaffoldBackgroundColor: const Color(0xFFF2EEF7)),
            home: const QuestionnairePage(title: 'Questionnaire')));
  }
}
