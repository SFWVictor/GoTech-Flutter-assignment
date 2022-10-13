import 'package:flutter/material.dart';
import 'package:gotech_questionnaire/bloc/questionnaire_bloc.dart';
import 'package:gotech_questionnaire/data/questions/question.dart';

import '../bloc/bloc_provider.dart';
import '../data/answers/questionnaire_answers.dart';
import '../data/questions/questionnaire.dart';
import '../data/questions/open/question.dart';
import '../data/questions/multiple_choice/question.dart';
import '../ui/questions/multiple_choice/multiple_choice.dart'
    as multiple_choice_question_widget;
import '../ui/questions/open/open_question.dart' as open_question_widget;
import '../ui/title_card.dart';

class QuestionnairePage extends StatefulWidget {
  final String title;

  const QuestionnairePage({super.key, required this.title});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  @override
  void initState() {
    super.initState();
    var bloc = BlocProvider.of<QuestionnaireBloc>(context);
    bloc.search.add(null);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QuestionnaireBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _getPageWidget(bloc),
          ),
        ),
      ),
    );
  }

  Widget _getPageWidget(QuestionnaireBloc bloc) {
    return StreamBuilder<Questionnaire?>(
      stream: bloc.questionnaireStream,
      builder: (context, snapshot) {
        final results = snapshot.data;
        if (results == null) {
          return const Center(child: Text('Loading ...'));
        }

        return _getQuestionnaireWidget(bloc, results);
      },
    );
  }

  Widget _getQuestionnaireWidget(
      QuestionnaireBloc bloc, Questionnaire questionnaire) {
    var columnChildren = <Widget>[];
    columnChildren.addAll([
      const SizedBox(
        height: 15,
      ),
      TitleCard(
          title: questionnaire.title,
          subtitle: questionnaire.subtitle,
          hasRequiredQuestions:
              questionnaire.questions.any((question) => question.isRequired)),
      const SizedBox(
        height: 15,
      )
    ]);

    columnChildren.add(ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: questionnaire.questions.length,
      itemBuilder: (context, index) {
        final question = questionnaire.questions[index];
        return _getQuestionWidget(question);
      },
    ));

    columnChildren.addAll([
      const SizedBox(
        height: 15,
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          //TODO pass actual data
          onPressed: () => bloc.submit
              .add(QuestionnaireAnswers(questionnaireId: 1, answers: [])),
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.deepPurple)),
          child: const Text('Submit'),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ]);

    return Column(children: columnChildren);
  }

  Widget _getQuestionWidget(Question question) {
    switch (question.runtimeType) {
      case OpenQuestion:
        return open_question_widget.OpenQuestion(
            question: question as OpenQuestion);
      case MultipleChoiceQuestion:
        return multiple_choice_question_widget.MultipleChoiceQuestion(
            question: question as MultipleChoiceQuestion);
      default:
        //TODO handle this somewhere
        throw Exception('Unrecognized question type');
    }
  }
}
