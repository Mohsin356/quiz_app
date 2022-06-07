import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
   Quiz({Key? key,required this.questions, required this.questionIndex,
   required this.answerQuestion }) : super(key: key);
   final List<Map<String,Object>> questions;
   final int questionIndex;
   final Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(questions[questionIndex]['Question Text'].toString()),
        //map list into list of widgets
        ...(questions[questionIndex]['answer'] as List<Map<String,Object>>).map((answer){
          return ElevatedButton(onPressed: ()=>answerQuestion(answer['score']), child: Text(answer['Text'].toString()));
        }).toList()
      ],
    );
  }
}
