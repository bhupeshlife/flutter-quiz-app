class AllQuizQuestion {
  const AllQuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getSuffledAnswers() {
    final suffeledList = List.of(answers);
    suffeledList.shuffle();
    return suffeledList;
  }
}
