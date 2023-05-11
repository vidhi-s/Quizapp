import 'package:flutter/material.dart';
import 'question.dart';
import 'questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz que = Quiz();

void main() => runApp(Quizee());

class Quizee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Center(child: Text("quiz")),
        ),
        backgroundColor: Colors.blue[400],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];
  void checkans(userans) {
    bool ans = que.geta();
    setState(() {

      if (que.done() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Finally End of the Quiz',
        ).show();
        que.reset();
        score = [];
      }
      else {

        if (ans == userans) {
          setState(
            () {
              score.add(Icon(
                Icons.done,
                color: Colors.green[900],
              ));
            },
          );
        } else {
          setState(
            () {
              score.add(Icon(
                Icons.close,
                color: Colors.red,
              ));
            },
          );
        }


      que.nextq();}});}


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                que.getq(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.green),
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkans(true);
                  }),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkans(false);

                },
              ),
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
