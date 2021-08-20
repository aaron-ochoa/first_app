import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//main function that is automatically executed with the app launches
void main() {
  runApp(FirstApp());
}

// void main() => runApp(FirstApp());

//every widget in flutter needs to extend StatelessWidget or StateFullWidget
//each of those classes with require you to have a build class
//Flutter will call this method with it is prompted to draw something on the screen
class FirstApp extends StatefulWidget {
  //needs to add a create state class
  @override
  State<StatefulWidget> createState() {
    //return a FirstAppState object to the UI
    return _FirstAppState();
  }
}

//creates a pointer to the FirstApp class
class _FirstAppState extends State<FirstApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  //maps kind of like a dictionary have a key value pair and this can be anything
  //from a string to a list
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'lion', 'score': 10},
        {'text': 'tiger', 'score': 5},
        {'text': 'bear', 'score': 3},
        {'text': 'Oh my!', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favorite sports team?',
      'answers': [
        {'text': 'Lakers', 'score': 0},
        {'text': 'Dodgers', 'score': 3},
        {'text': 'Packers', 'score': 5},
        {'text': 'Cubs', 'score': 10}
      ],
    },
  ];

  //method for the button press that is in this class
  void _answerQuestion(int score) {
    //getting the total score for the quiz
    _totalScore += score;

    //setState() is a "trigger" that informs Flutter that it needs to
    //re-run build() of the Widget.
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
    print(_questionIndex);
  }

  //the goal of this is to reset the app
  //to reset the app the _questionIndex and the _totalScore needs to be zero
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  //overriding the statelesswidget build method and making it clear that this
  //was not a accident
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        //the ? is the start of the if/else statement
        //there can one be one element if it is true to excute in this case its column
        body: _questionIndex < _questions.length
            ? Quiz(
                //this is using named arguements
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            //the : is the else block of the if statement
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
