import 'package:flutter/material.dart';

class ResultQuiz extends StatefulWidget {
  final int acertos;
  ResultQuiz(this.acertos);
  @override
  _ResultQuiz createState() => _ResultQuiz();
}

class _ResultQuiz extends State<ResultQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF355D7D),
      appBar: AppBar(
        title: Text('RESULTADO'),
        backgroundColor: Color(0xffe84a5f),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Seus acertos:'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.acertos.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}