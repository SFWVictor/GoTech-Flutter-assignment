abstract class Answer {
  final int questionId;

  Answer(this.questionId);

  Map<String, dynamic> toJson();
}
