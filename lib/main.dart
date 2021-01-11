import 'package:flutter/material.dart';
import 'quiz.dart';
import 'memoryGame.dart';
import 'cardGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2a363b),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xfff67280),
                ), // BoxDecoration
                child: Center(
                  child: Text(
                    'BOBEOU, DANÇOU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz())
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffe84a5f),
                    boxShadow: [BoxShadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 15.0, spreadRadius: 1.0)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.create,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        'QUIZ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MemoryGame())
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffff847c),
                    boxShadow: [BoxShadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 15.0, spreadRadius: 1.0)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.face_retouching_natural,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        'JOGO DA MEMÓRIA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CardGame())
                  );
                },
                child:  Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffc06c84),
                    boxShadow: [BoxShadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 15.0, spreadRadius: 1.0)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.my_library_books ,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        'JOGO DE CARTAS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
