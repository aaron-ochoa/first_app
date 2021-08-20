import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    //each widget can only hold one other widget
    //with the help of the layout widget like 'column' or 'row' you are
    //able to put widgets next to each other
    return Column(
      //the children of the column is a list aka array of widgets
      children: [
        //to access a map you need the index '_questionIndex' so it knows
        //which question text to look at
        //then the key value 'questionText' to know what to output on the screen
        Question(questions[questionIndex]['questionText']),
        //transforming the list into something else with the .map method
        //map method excutes a function on every item within the questions list
        //dart cannot infer what type of datat 'answers' will be so you can tell
        //it by putting the as List<String> so now dart know what to expect
        //the ... creates indivdual widgets for each return answer
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          //first value should be the handler
          //creating a function on the fly with the () => that is not called until a button press
          //by doing that you are able to pass in the score parameter to the function
          //without it being called be the button press
          return Answer(() => answerQuestion(answer['score']), answer['text']);
          //converts the value that map gives us to a list
        }).toList()
      ],
    );
  }
}
