class Question {
  String questionText;
  bool questionAnswer;

  Question({String question, bool answer}) {
    questionText = question;
    questionAnswer = answer;
  }
}

Question q1 = Question(question: 'Is my name Kantish?', answer: true);
