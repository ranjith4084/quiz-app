import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'You are Good!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Somewhat ok!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'Still need to achive more!';
    } else if (resultScore >= 1) {
      resultText = 'poor!';
    } else {
      resultText = 'worst fello study well!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ), //Text
            textColor: Colors.blue,
            onPressed: resetHandler,
          ), //FlatButton
          Center(
            child: Image.asset(
              "images/thanks.png",
              width: 250,
              height: 180,
            ),
          ),
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
