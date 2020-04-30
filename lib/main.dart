import 'package:flutter/material.dart';
import 'package:flutterquizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Widget answerButton(bool answer, String buttonText, int buttonColor) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FlatButton(
          onPressed: () {
            setState(
              () {
                ans = quizBrain.getQuestionAnswer();
                if (ans == answer) {
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scorekeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                }
                if (quizBrain.questionBank.length - 1 ==
                    quizBrain.getIndexValue()) {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Well Done!",
                    desc: "You completed the Quiz.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Play Again!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () {
                          quizBrain.qnum = 0;
                          scorekeeper.clear();
                          setState(() {});
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ).show();
                }
                quizBrain.nextQuestion();
              },
            );
          },
          child: Text(buttonText),
          color: Color(buttonColor),
        ),
      ),
    );
  }

  QuizBrain quizBrain = QuizBrain();
  bool ans;
  List<Icon> scorekeeper = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          answerButton(true, "TRUE", 0xff008000),
          answerButton(false, "FALSE", 0xff8b0000),
          Row(
            children: scorekeeper,
          ),
        ],
      ),
    );
  }
}
