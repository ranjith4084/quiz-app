import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Who is chief minister of TamilNadu?',
      'answers': [
        {'text': 'TTV ', 'score': -2},
        {'text': 'OPS', 'score': -2},
        {'text': 'EPS', 'score': 10},
        {'text': 'VKS', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. IN WHICH YEAR COVID-19 AFFECTED?',
      'answers': [
        {'text': '2019', 'score': -2},
        {'text': '2013', 'score': -2},
        {'text': '2018', 'score': -2},
        {'text': '2020', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. what is the national animal of India',
      'answers': [
        {'text': 'Elephant', 'score': -2},
        {'text': 'Tiger', 'score': 10},
        {'text': 'crocodile', 'score': -2},
        {'text': 'snake', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. What language is used in Flutter?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'c', 'score': -2},
        {'text': 'c++', 'score': -2},
        {'text': 'R', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Which is more powerful Hippo or Rhino?',
      'answers': [
        {
          'text': 'Rhino',
          'score': -2,
        },
        {'text': 'Hippo', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RANJITH QUIZ'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      //debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
