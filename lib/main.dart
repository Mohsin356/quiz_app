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
    {'Question Text':'What\'s your favourite color?',
      "answer":[
        {'Text':'Red','score':10},
        {'Text':'Black','score':8},
        {'Text':'Grey','score':6},
        {'Text':'Yellow','score':4}
      ]},
    {'Question Text':'What\'s your favourite animal?',
      "answer":[
        {'Text':'Lion','score':10},
        {'Text':'Tiger','score':8},
        {'Text':'Panda','score':6}
      ]},
    {'Question Text':'What\'s your favourite subject?',
      "answer":[
        {'Text':'Computer','score':10},
        {'Text':'Biology','score':8},
        {'Text':'Economics','score':6},
      ]},
  ];

  var _questionIndex= 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState((){
      _questionIndex=0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;
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
              :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                Text("Quiz Finished. Your score is: $_totalScore",
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),textAlign: TextAlign.center,),
                TextButton(onPressed: _resetQuiz, child: const
                Text("Restart Quiz" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),))
            ],
          ),
              ),
        ),
      ),
    );

  }
}