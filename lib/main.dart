import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/quiz.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget{
   const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final _questions=  const [
    {'Question Text':'What\'s your favourite color?', "answer":['Red','Blue','Green','Yellow']},
    {'Question Text':'What\'s your favourite animal?', "answer":['Cat','Dog','Panda']},
    {'Question Text':'What\'s your favourite subject?', "answer":['Science','Geography','Economics']},
  ];

  var _questionIndex= 0;

  void _answerQuestion(){
   setState((){
     _questionIndex =_questionIndex+1;
   });
  }
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Quiz")),),
        body: Center(
          child: _questionIndex < _questions.length ?
          Quiz(questions: _questions,questionIndex: _questionIndex,answerQuestion: _answerQuestion,
          )
              :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Quiz Finished"),
            ],
          ),
        ),
      ),
    );

  }
}