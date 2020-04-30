import 'question.dart';

class QuizBrain {
  int qnum = 0;

  List<Question> questionBank = [
    Question(question: 'India is best country in the world', answer: true),
    Question(question: 'MSD is captain of RCB', answer: false),
    Question(question: 'Rahul Gandhi is PM', answer: false),
    Question(question: 'HTML is programming language', answer: false),
    Question(question: 'Is it safe to go and eat pani puri', answer: true)
  ];

  void nextQuestion() {
    if (qnum < questionBank.length - 1) {
      qnum++;
    }
  }

  String getQuestionText() {
    return questionBank[qnum].questionText;
  }

  bool getQuestionAnswer() {
    return questionBank[qnum].questionAnswer;
  }

  int getIndexValue() {
    return qnum;
  }
}
