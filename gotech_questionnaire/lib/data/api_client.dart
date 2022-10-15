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

  Future<Questionnaire?> getQuestionnaire() async {
    http.Response response;
    Questionnaire result;
    try {
      response = await http.get(questionnairesEndpoint);
      result = Questionnaire.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      return result;
    } else {
      return null;
    }
  }

  Future<bool> postAnswers(QuestionnaireAnswers answers) async {
    http.Response response;
    try {
      response = await http.post(answersEndpoint,
          body: jsonEncode(answers.toJson()),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return false;
    }

    if (response.statusCode >= 400) {
      return false;
    } else {
      return true;
    }
  }
}
