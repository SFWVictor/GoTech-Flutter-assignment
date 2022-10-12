abstract class Answer {
  final String questionId;

  Answer(this.questionId);

  Map<String, dynamic> toJson();
}
