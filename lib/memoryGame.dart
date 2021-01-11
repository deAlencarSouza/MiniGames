import 'package:flutter/material.dart';
import 'cardClass.dart' as card;
import 'dart:async';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<card.Card> cards = [
    card.Card(1, 1, 'NÓS', Color(0xFF6C5B7B), true),
    card.Card(2, 2, 'VOCÊ', Color(0xFFC0C684), true),
    card.Card(3, 3, 'VELHA', Color(0xFFF67280), true),
    card.Card(4, 4, 'OUTRO', Color(0xFFF8B195), true),
    card.Card(5, 5, 'BOA', Color(0xFF6C5B7B), true),
    card.Card(6, -1, 'NOIS', Color(0xFFC0C684), true),
    card.Card(7, -2, 'OCÊ', Color(0xFFF67280), true),
    card.Card(8, -3, 'VEIA', Color(0xFFF8B195), true),
    card.Card(9, -4, 'OTRO', Color(0xFF6C5B7B), true),
    card.Card(10, -5, 'BOUA', Color(0xFFC0C684), true),
    card.Card(11, 6, 'IGUAL', Color(0xFFF67280), true),
    card.Card(12, 7, 'VOLTOU', Color(0xFFF8B195), true),
    card.Card(13, 8, 'VEZ', Color(0xFFF67280), true),
    card.Card(14, 9, 'BEM', Color(0xFFF8B195), true),
    card.Card(15, 10, 'ENTROU', Color(0xFF6C5B7B), true),
    card.Card(16, -6, 'INGUAL', Color(0xFFC0C684), true),
    card.Card(17, -7, 'VOUTO', Color(0xFFF67280), true),
    card.Card(18, -8, 'VEIZ', Color(0xFFF8B195), true),
    card.Card(19, -9, 'BEIN', Color(0xFF6C5B7B), true),
    card.Card(20, -10, 'ENTRO', Color(0xFFC0C684), true),
  ];

  bool checksVisibility;

  int _numberAttempt = 10;

  hideAndShuffleContent() {
    setState((){
      for(int i = 0; i <= cards.length - 1; i++) {
        cards[i].contentVisibility = false;
      }
      cards.shuffle();
    });
  }

  String _mensagem = 'VAMOS JOGAR';

  int hitsCards = 0;


  Timer timer1;

  checksKeyCards() {
    if((keyCard1 + keyCard2) == 0) {
      keyCard1 = 0;
      keyCard2 = 0;
      setState((){
        _mensagem = 'PONTO!';
        hitsCards++;
        timer1 = Timer(
            Duration (milliseconds: 500),
                () {
              setState((){
                for(int i = 0; i <= cards.length - 1; i++) {
                  cards[i].contentVisibility = false;
                  _mensagem = 'VAMOS JOGAR!';
                }
                if(_numberAttempt != 10) {
                  _numberAttempt++;
                }
                cards.shuffle();
              });
              _restartGame();
            }
        );
      });
    }else {
      keyCard1 = 0;
      keyCard2 = 0;
      setState((){
        _mensagem = 'PERDEU!';
        timer1 = Timer(
            Duration (milliseconds: 500),
                () {
              setState((){
                for(int i = 0; i <= cards.length - 1; i++) {
                  cards[i].contentVisibility = false;
                }
                _mensagem = 'VAMOS JOGAR!';
                _numberAttempt--;
              });
              _restartGame();
            }
        );
      });
    }
  }

  double contentFontSize = 12;

  _restartGame() {
    if(_numberAttempt == 0) {
      hitsCards = 0;
      _numberAttempt = 10;
      hideAndShuffleContent();
    }
  }

  int keyCard1 = 0;
  int keyCard2 = 0;

  getKeyCards(int keyCard) {
    if(keyCard1 == 0) {
      keyCard1 = keyCard;
    }else {
      keyCard2 = keyCard;
      checksKeyCards();
    }
  }

  double _sizeContainer = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF355D7D),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white
                ), // TextStyle
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chances: ${_numberAttempt.toString()}/10",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                    Text(
                      "Acertos: ${hitsCards.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                  ], // <Widget>[]
                ), // Row
              ), // Padding
              SizedBox(
                height: 240,
                width: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length - 15,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  bool checksVisibility = cards[index].checksVisibility();
                                  if(checksVisibility != false) {
                                    setState((){
                                      cards[index].contentVisibility = true;
                                    });
                                    getKeyCards(cards[index].keyCard);
                                  }
                                },
                                child: Container(
                                  width: _sizeContainer,
                                  height: _sizeContainer,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: cards[index].backgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(1, 1),
                                          blurRadius: 12.0,
                                          spreadRadius: 2.0)
                                    ],
                                  ),
                                  child: Visibility(
                                    visible: cards[index].contentVisibility,
                                    child: Center(
                                      child: Text(
                                        cards[index].content,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: contentFontSize,
                                            color: Colors.white
                                        ), // TextStyle
                                      ), // Text
                                    ), // Center
                                  ), // Visibility
                                ), // Container
                              ), // GestureDetector
                            ], // <Widget>[]
                          ), // Row
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  bool checksVisibility = cards[index + 5].checksVisibility();
                                  if(checksVisibility != false) {
                                    setState((){
                                      cards[index + 5].contentVisibility = true;
                                    });
                                    getKeyCards(cards[index + 5].keyCard);
                                  }
                                },
                                child: Container(
                                  width: _sizeContainer,
                                  height: _sizeContainer,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: cards[index + 5].backgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(1, 1),
                                          blurRadius: 16.0,
                                          spreadRadius: 2.0)
                                    ],
                                  ),
                                  child: Visibility(
                                    visible: cards[index + 5].contentVisibility,
                                    child: Center(
                                      child: Text(
                                        cards[index + 5].content,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: contentFontSize,
                                            color: Colors.white
                                        ), // TextStyle
                                      ), // Text
                                    ), // Center
                                  ), // Visibility
                                ), // Container
                              ), // GestureDetector
                            ], // <Widget>[]
                          ), // Row
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  checksVisibility = cards[index + 10].checksVisibility();
                                  if(checksVisibility != false) {
                                    setState((){
                                      cards[index + 10].contentVisibility = true;
                                    });
                                    getKeyCards(cards[index + 10].keyCard);
                                  }
                                },
                                child: Container(
                                  width: _sizeContainer,
                                  height: _sizeContainer,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: cards[index + 10].backgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(1, 1),
                                          blurRadius: 16.0,
                                          spreadRadius: 2.0)
                                    ],
                                  ),
                                  child: Visibility(
                                    visible: cards[index + 10].contentVisibility,
                                    child: Center(
                                      child: Text(
                                        cards[index + 10].content,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: contentFontSize,
                                            color: Colors.white
                                        ), // TextStyle
                                      ), // Text
                                    ), // Center
                                  ), // Visibility
                                ), // Container
                              ), // GestureDetector
                            ], // <Widget>[]
                          ), // Row
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  bool checksVisibility = cards[index + 15].checksVisibility();
                                  if(checksVisibility != false) {
                                    setState((){
                                      cards[index + 15].contentVisibility = true;
                                    });
                                    getKeyCards(cards[index + 15].keyCard);
                                  }
                                },
                                child: Container(
                                  width: _sizeContainer,
                                  height: _sizeContainer,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: cards[index + 15].backgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(1, 1),
                                          blurRadius: 16.0,
                                          spreadRadius: 2.0)
                                    ],
                                  ),
                                  child: Visibility(
                                    visible: cards[index + 15].contentVisibility,
                                    child: Center(
                                      child: Text(
                                        cards[index + 15].content,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: contentFontSize,
                                            color: Colors.white
                                        ), // TextStyle
                                      ), // Text
                                    ), // Center
                                  ), // Visibility
                                ), // Container
                              ), // GestureDetector
                            ], // <Widget>[]
                          ), // Row
                        ], // <Widget>[]
                      ); // Column
                    }
                ), // ListView.builder
              ), // SizedBox
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    hideAndShuffleContent();
                  },
                  color: Color(0xFFFF847C),
                  textColor: Colors.white,
                  child: Text(
                      'EMBARALHAR',
                      style: TextStyle(fontSize: 25)
                  ), // Text
                ), // RaisedButton
              ), // Padding
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xFF99B898),
                  textColor: Colors.white,
                  child: Text(
                      'VOLTAR',
                      style: TextStyle(fontSize: 25)
                  ), // Text
                ), // RaisedButton
              ), // Padding
            ], // <Widget>[]
          ), // Column
        ), // Container
      ), // Center
    ); // Scaffold
  }
}