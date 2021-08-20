import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    //styling question text
    //wrapping the text widget in a container widget to get the correct alignment
    return Container(
      //setting the container width will take up as much space as it needs to
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        //the text widget only uses as much space as needed so aligning wont really
        //do much
        textAlign: TextAlign.center,
      ),
    );
  }
}
