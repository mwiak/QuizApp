class Question {
  Question({required this.id, required this.title, required this.choices});
  late int id;
  late String title;
  late List<Map<String, bool>> choices;
}

class SingleAnswerQuestion extends Question {
  SingleAnswerQuestion(
      {required super.id, required super.title, required super.choices});
}

class MultipleAnswersQuestion extends Question {
  MultipleAnswersQuestion(
      {required super.id, required super.title, required super.choices});
}
