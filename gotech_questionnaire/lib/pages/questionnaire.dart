import 'package:flutter/material.dart';
import 'package:gotech_questionnaire/bloc/questionnaire_bloc.dart';

import '../bloc/bloc_provider.dart';
import '../bloc/models/multiple_choice_question.dart';
import '../bloc/models/open_question.dart';
import '../bloc/models/question.dart';
import '../bloc/questionnaire_model.dart';
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
    return StreamBuilder<QuestionnaireModel?>(
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
      QuestionnaireBloc bloc, QuestionnaireModel model) {
    var columnChildren = <Widget>[];
    columnChildren.addAll([
      const SizedBox(
        height: 15,
      ),
      TitleCard(
          title: model.questionnaireData.title,
          subtitle: model.questionnaireData.subtitle,
          hasRequiredQuestions:
              model.questions.any((question) => question.data.isRequired)),
      const SizedBox(
        height: 15,
      )
    ]);

    columnChildren.add(ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: model.questions.length,
      itemBuilder: (context, index) {
        final question = model.questions[index];
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
          onPressed: () => bloc.submit.add(null),
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

  Widget _getQuestionWidget(QuestionModel question) {
    switch (question.runtimeType) {
      case OpenQuestionModel:
        return open_question_widget.OpenQuestion(
            question: question as OpenQuestionModel);
      case MultipleChoiceQuestionModel:
        return multiple_choice_question_widget.MultipleChoiceQuestion(
            question: question as MultipleChoiceQuestionModel);
      default:
        //TODO handle this somewhere
        throw Exception('Unrecognized question type');
    }
  }
}
