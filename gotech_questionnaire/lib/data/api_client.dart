import 'package:http/http.dart' as http;
import 'dart:convert';

import 'questions/questionnaire.dart';
import 'answers/questionnaire_answers.dart';

class ApiClient {
  static const String host = 'http://localhost:3000';
  static const String questionnaires = '/questionnaires/1';
  static const String answers = '/answers';

  final Uri questionnairesEndpoint = Uri.parse(host + questionnaires);
  final Uri answersEndpoint = Uri.parse(host + answers);

  Future<Questionnaire> getQuestionnaire() async {
    final response = await http.get(questionnairesEndpoint);

    if (response.statusCode == 200) {
      return Questionnaire.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load questionnaire');
    }
  }

  Future postAnswers(QuestionnaireAnswers answers) async {
    final response = await http.post(answersEndpoint,
        body: answers, headers: {"Content-Type": "application/json"});

    if (response.statusCode >= 400) {
      throw Exception('Failed to post answwers');
    } else {
      return;
    }
  }
}
