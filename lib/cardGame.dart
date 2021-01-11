import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'cardClass.dart' as card;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CardGame(),
  )); // MaterialApp
}

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  
  // logo abaixo, eu coloquei as listas no próprio código pois foi um dos meus primeiros projetos - hoje, reconheço a pouca otimização e pouca organização
  
  List<card.Card> machineCards = [
    card.Card(0, 1, 'nós', Color(0xFF6C5B7B), true),
    card.Card(1, 1, 'nós', Color(0xFFC0C684), true),
    card.Card(2, 1, 'nós', Color(0xFFF67280), true),
    card.Card(3, 1, 'nós', Color(0xFFF8B195), true),
    card.Card(4, 2, 'você', Color(0xFF6C5B7B), true),
    card.Card(5, 2, 'você', Color(0xFFC0C684), true),
    card.Card(6, 2, 'você', Color(0xFFF67280), true),
    card.Card(7, 2, 'você', Color(0xFFF8B195), true),
    card.Card(8, 3, 'bem', Color(0xFF6C5B7B), true),
    card.Card(9, 3, 'bem', Color(0xFFC0C684), true),
    card.Card(10, 3, 'bem', Color(0xFFF67280), true),
    card.Card(11, 3, 'bem', Color(0xFFF8B195), true),
    card.Card(12, 4, 'igual', Color(0xFF6C5B7B), true),
    card.Card(13, 4, 'igual', Color(0xFFC0C684), true),
    card.Card(14, 4, 'igual', Color(0xFFF67280), true),
    card.Card(15, 4, 'igual', Color(0xFFF8B195), true),
    card.Card(16, 5, 'voltou', Color(0xFF6C5B7B), true),
    card.Card(17, 5, 'voltou', Color(0xFFC0C684), true),
    card.Card(18, 5, 'voltou', Color(0xFFF67280), true),
    card.Card(19, 5, 'voltou', Color(0xFFF8B195), true),
    card.Card(20, 6, 'velha', Color(0xFF6C5B7B), true),
    card.Card(21, 6, 'velha', Color(0xFFC0C684), true),
    card.Card(22, 6, 'velha', Color(0xFFF67280), true),
    card.Card(23, 6, 'velha', Color(0xFFF8B195), true),
    card.Card(24, 7, 'outro', Color(0xFF6C5B7B), true),
    card.Card(25, 7, 'outro', Color(0xFFC0C684), true),
    card.Card(26, 7, 'outro', Color(0xFFF67280), true),
    card.Card(27, 7, 'outro', Color(0xFFF8B195), true),
    card.Card(28, 8, 'vez', Color(0xFF6C5B7B), true),
    card.Card(29, 8, 'vez', Color(0xFFC0C684), true),
    card.Card(30, 8, 'vez', Color(0xFFF67280), true),
    card.Card(31, 8, 'vez', Color(0xFFF8B195), true),
    card.Card(32, -1, 'nois', Color(0xFF6C5B7B), true),
    card.Card(33, -1, 'nois', Color(0xFFC0C684), true),
    card.Card(34, -1, 'nois', Color(0xFFF67280), true),
    card.Card(35, -1, 'nois', Color(0xFFF8B195), true),
    card.Card(36, -2, 'ocê', Color(0xFF6C5B7B), true),
    card.Card(37, -2, 'ocê', Color(0xFFC0C684), true),
    card.Card(38, -2, 'ocê', Color(0xFFF67280), true),
    card.Card(39, -2, 'ocê', Color(0xFFF8B195), true),
    card.Card(40, -3, 'bein', Color(0xFF6C5B7B), true),
    card.Card(41, -3, 'bein', Color(0xFFC0C684), true),
    card.Card(42, -3, 'bein', Color(0xFFF67280), true),
    card.Card(43, -3, 'bein', Color(0xFFF8B195), true),
    card.Card(44, -4, 'ingual', Color(0xFF6C5B7B), true),
    card.Card(45, -4, 'ingual', Color(0xFFC0C684), true),
    card.Card(46, -4, 'ingual', Color(0xFFF67280), true),
    card.Card(47, -4, 'ingual', Color(0xFFF8B195), true),
    card.Card(48, -5, 'voltô', Color(0xFF6C5B7B), true),
    card.Card(49, -5, 'voltô', Color(0xFFC0C684), true),
    card.Card(50, -5, 'voltô', Color(0xFFF67280), true),
    card.Card(51, -5, 'voltô', Color(0xFFF8B195), true),
    card.Card(52, -6, 'veia', Color(0xFF6C5B7B), true),
    card.Card(53, -6, 'veia', Color(0xFFC0C684), true),
    card.Card(54, -6, 'veia', Color(0xFFF67280), true),
    card.Card(55, -6, 'veia', Color(0xFFF8B195), true),
    card.Card(56, -7, 'otro', Color(0xFF6C5B7B), true),
    card.Card(57, -7, 'otro', Color(0xFFC0C684), true),
    card.Card(58, -7, 'otro', Color(0xFFF67280), true),
    card.Card(59, -7, 'otro', Color(0xFFF8B195), true),
    card.Card(60, -8, 'veiz', Color(0xFF6C5B7B), true),
    card.Card(61, -8, 'veiz', Color(0xFFC0C684), true),
    card.Card(62, -8, 'veiz', Color(0xFFF67280), true),
    card.Card(63, -8, 'veiz', Color(0xFFF8B195), true),
  ];

  List<card.Card> playerCards = [
    card.Card(0, 1, 'nós', Color(0xFF6C5B7B), true),
    card.Card(1, 1, 'nós', Color(0xFFC0C684), true),
    card.Card(2, 1, 'nós', Color(0xFFF67280), true),
    card.Card(3, 1, 'nós', Color(0xFFF8B195), true),
    card.Card(4, 2, 'você', Color(0xFF6C5B7B), true),
    card.Card(5, 2, 'você', Color(0xFFC0C684), true),
    card.Card(6, 2, 'você', Color(0xFFF67280), true),
    card.Card(7, 2, 'você', Color(0xFFF8B195), true),
    card.Card(8, 3, 'bem', Color(0xFF6C5B7B), true),
    card.Card(9, 3, 'bem', Color(0xFFC0C684), true),
    card.Card(10, 3, 'bem', Color(0xFFF67280), true),
    card.Card(11, 3, 'bem', Color(0xFFF8B195), true),
    card.Card(12, 4, 'igual', Color(0xFF6C5B7B), true),
    card.Card(13, 4, 'igual', Color(0xFFC0C684), true),
    card.Card(14, 4, 'igual', Color(0xFFF67280), true),
    card.Card(15, 4, 'igual', Color(0xFFF8B195), true),
    card.Card(16, 5, 'voltou', Color(0xFF6C5B7B), true),
    card.Card(17, 5, 'voltou', Color(0xFFC0C684), true),
    card.Card(18, 5, 'voltou', Color(0xFFF67280), true),
    card.Card(19, 5, 'voltou', Color(0xFFF8B195), true),
    card.Card(20, 6, 'velha', Color(0xFF6C5B7B), true),
    card.Card(21, 6, 'velha', Color(0xFFC0C684), true),
    card.Card(22, 6, 'velha', Color(0xFFF67280), true),
    card.Card(23, 6, 'velha', Color(0xFFF8B195), true),
    card.Card(24, 7, 'outro', Color(0xFF6C5B7B), true),
    card.Card(25, 7, 'outro', Color(0xFFC0C684), true),
    card.Card(26, 7, 'outro', Color(0xFFF67280), true),
    card.Card(27, 7, 'outro', Color(0xFFF8B195), true),
    card.Card(28, 8, 'vez', Color(0xFF6C5B7B), true),
    card.Card(29, 8, 'vez', Color(0xFFC0C684), true),
    card.Card(30, 8, 'vez', Color(0xFFF67280), true),
    card.Card(31, 8, 'vez', Color(0xFFF8B195), true),
    card.Card(32, -1, 'nois', Color(0xFF6C5B7B), true),
    card.Card(33, -1, 'nois', Color(0xFFC0C684), true),
    card.Card(34, -1, 'nois', Color(0xFFF67280), true),
    card.Card(35, -1, 'nois', Color(0xFFF8B195), true),
    card.Card(36, -2, 'ocê', Color(0xFF6C5B7B), true),
    card.Card(37, -2, 'ocê', Color(0xFFC0C684), true),
    card.Card(38, -2, 'ocê', Color(0xFFF67280), true),
    card.Card(39, -2, 'ocê', Color(0xFFF8B195), true),
    card.Card(40, -3, 'bein', Color(0xFF6C5B7B), true),
    card.Card(41, -3, 'bein', Color(0xFFC0C684), true),
    card.Card(42, -3, 'bein', Color(0xFFF67280), true),
    card.Card(43, -3, 'bein', Color(0xFFF8B195), true),
    card.Card(44, -4, 'ingual', Color(0xFF6C5B7B), true),
    card.Card(45, -4, 'ingual', Color(0xFFC0C684), true),
    card.Card(46, -4, 'ingual', Color(0xFFF67280), true),
    card.Card(47, -4, 'ingual', Color(0xFFF8B195), true),
    card.Card(48, -5, 'voltô', Color(0xFF6C5B7B), true),
    card.Card(49, -5, 'voltô', Color(0xFFC0C684), true),
    card.Card(50, -5, 'voltô', Color(0xFFF67280), true),
    card.Card(51, -5, 'voltô', Color(0xFFF8B195), true),
    card.Card(52, -6, 'veia', Color(0xFF6C5B7B), true),
    card.Card(53, -6, 'veia', Color(0xFFC0C684), true),
    card.Card(54, -6, 'veia', Color(0xFFF67280), true),
    card.Card(55, -6, 'veia', Color(0xFFF8B195), true),
    card.Card(56, -7, 'otro', Color(0xFF6C5B7B), true),
    card.Card(57, -7, 'otro', Color(0xFFC0C684), true),
    card.Card(58, -7, 'otro', Color(0xFFF67280), true),
    card.Card(59, -7, 'otro', Color(0xFFF8B195), true),
    card.Card(60, -8, 'veiz', Color(0xFF6C5B7B), true),
    card.Card(61, -8, 'veiz', Color(0xFFC0C684), true),
    card.Card(62, -8, 'veiz', Color(0xFFF67280), true),
    card.Card(63, -8, 'veiz', Color(0xFFF8B195), true),
  ];

  int amountPlayerCards = 8;
  int amountMachineCads = 8;

  bool machineCardsVisibility = false;
  bool playerCardsVisibility = false;
  bool lotContainerVisibility = false;
  bool selectedCardVisibility = false;
  bool turnButtonVisibility = false;
  bool mensageVisibility = false;
  bool startGameButton = true;

  String selectedCardContent = 'Hello world';
  Color selectedCardBackgroundColor = Color(0xFF355D7D);

  card.Card selectedMachineCard;
  card.Card selectedPlayerCard;
  card.Card selectedCardToShow;

  startGame() {
    setState(() {
      machineCardsVisibility = true;
      playerCardsVisibility = true;
      lotContainerVisibility = true;
      turnButtonVisibility = true;
      mensageVisibility = true;
      startGameButton = false;
      machineCards.shuffle();
      playerCards.shuffle();
    });
  }

  getSelectedPlayerCard(card.Card selectedCard) {
    selectedPlayerCard = selectedCard;
    selectedCardToShow = selectedCard;
    showSelectedCard(
      selectedPlayerCard.content,
      selectedPlayerCard.backgroundColor,
    );
    if(amountPlayerCards > 0) {
      machineCardGenerator();
    }
    mensageVisibility = true;
    setState(() {
      menssagem = 'Vez do oponente';
    });
  }

  getSelectedMachineCard(card.Card selectedCard) {
    selectedMachineCard = selectedCard;
    selectedCardToShow = selectedCard;
    showSelectedCard(
        selectedMachineCard.content,
        selectedMachineCard.backgroundColor,
    );
  }

  showSelectedCard(String content, Color backgroundColor) {
    setState(() {
      selectedCardVisibility = true;
      selectedCardContent = content;
      selectedCardBackgroundColor = backgroundColor;
    });
  }

  Timer counter;

  machineCardGenerator() {
    counter = Timer(
        Duration (seconds: 1),
        () {
          int randomNumber = Random().nextInt(amountMachineCads);
          card.Card randomCard = machineCards[randomNumber];
          if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
            randomNumber = Random().nextInt(amountMachineCads);
            randomCard = machineCards[randomNumber];
            if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
              randomNumber = Random().nextInt(amountMachineCads);
              randomCard = machineCards[randomNumber];
              if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
                randomNumber = Random().nextInt(amountMachineCads);
                randomCard = machineCards[randomNumber];
                if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
                  randomNumber = Random().nextInt(amountMachineCads);
                  randomCard = machineCards[randomNumber];
                  if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
                    randomNumber = Random().nextInt(amountMachineCads);
                    randomCard = machineCards[randomNumber];
                    if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
                      randomNumber = Random().nextInt(amountMachineCads);
                      randomCard = machineCards[randomNumber];
                      if((randomCard.keyCard + selectedCardToShow.keyCard) != 0 && randomCard.backgroundColor != selectedCardToShow.backgroundColor) {
                        randomNumber = Random().nextInt(amountMachineCads);
                        randomCard = machineCards[randomNumber];
                        if((randomCard.keyCard + selectedCardToShow.keyCard) == 0 || randomCard.backgroundColor == selectedCardToShow.backgroundColor) {
                          getSelectedMachineCard(randomCard);
                          machineCards.removeAt(randomNumber);
                          amountMachineCads--;
                        }else {
                          int machineChoice = Random().nextInt(2);
                          switch(machineChoice) {
                            case 0:
                              setState(() {
                                amountMachineCads++;
                                randomNumber = Random().nextInt(amountMachineCads);
                                randomCard = machineCards[randomNumber];
                                if((randomCard.keyCard + selectedCardToShow.keyCard) == 0 || randomCard.backgroundColor == selectedCardToShow.backgroundColor) {
                                  getSelectedMachineCard(randomCard);
                                  machineCards.removeAt(randomNumber);
                                  amountMachineCads--;
                                }else {
                                  setState(() {
                                    mensageVisibility = true;
                                    menssagem = 'Pediu mais 1 e passou a vez';
                                  });
                                }
                              });
                              break;
                            case 1:
                              setState(() {
                                mensageVisibility = true;
                                menssagem = 'Passou a vez';
                              });
                              break;
                          }
                        }
                      }else {
                        getSelectedMachineCard(randomCard);
                        machineCards.removeAt(randomNumber);
                        amountMachineCads--;
                        setState(() {
                          menssagem = 'Vez do oponente';
                        });
                        menssagem = 'Sua vez!';
                      }
                    }else {
                      getSelectedMachineCard(randomCard);
                      machineCards.removeAt(randomNumber);
                      amountMachineCads--;
                      setState(() {
                        menssagem = 'Vez do oponente';
                      });
                      menssagem = 'Sua vez!';
                    }
                  }else {
                    getSelectedMachineCard(randomCard);
                    machineCards.removeAt(randomNumber);
                    amountMachineCads--;
                    setState(() {
                      menssagem = 'Vez do oponente';
                    });
                    menssagem = 'Sua vez!';
                  }
                }else {
                  getSelectedMachineCard(randomCard);
                  machineCards.removeAt(randomNumber);
                  amountMachineCads--;
                  setState(() {
                    menssagem = 'Vez do oponente';
                  });
                  menssagem = 'Sua vez!';
                }
              }else {
                getSelectedMachineCard(randomCard);
                machineCards.removeAt(randomNumber);
                amountMachineCads--;
                setState(() {
                  menssagem = 'Vez do oponente';
                });
                menssagem = 'Sua vez!';
              }
            }else {
              getSelectedMachineCard(randomCard);
              machineCards.removeAt(randomNumber);
              amountMachineCads--;
              setState(() {
                menssagem = 'Vez do oponente';
              });
              menssagem = 'Sua vez!';
            }
          }else {
            getSelectedMachineCard(randomCard);
            machineCards.removeAt(randomNumber);
            amountMachineCads--;
            setState(() {
              menssagem = 'Vez do oponente';
            });
            menssagem = 'Sua vez!';
          }
        }
    );
  }

  changeTurnPlayer() {
    setState(() {
      menssagem = 'Vez do oponente';
    });
    machineCardGenerator();
  }

  checksAmountCards() {
    if(amountMachineCads == 0) {
      setState(() {
        menssagemNoBotao = 'O oponente venceu!';
        machineCardsVisibility = false;
        playerCardsVisibility = false;
        lotContainerVisibility = false;
        selectedCardVisibility = false;
        startGameButton = true;
        mensageVisibility = false;
        turnButtonVisibility = false;
      });
    }else if(amountPlayerCards == 0) {
      setState(() {
        menssagemNoBotao = 'Você venceu!';
        machineCardsVisibility = false;
        playerCardsVisibility = false;
        lotContainerVisibility = false;
        selectedCardVisibility = false;
        startGameButton = true;
        mensageVisibility = false;
        turnButtonVisibility = false;
      });
    }
  }

  String menssagem = 'Comecem!';
  String menssagemNoBotao = 'Começar';

  @override
  Widget build(BuildContext context) {
    checksAmountCards();
    return Scaffold(
      backgroundColor: Color(0xFF355D7D),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: machineCardsVisibility,
                child: SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: amountMachineCads,
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xffff847c),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(1, 1),
                                      blurRadius: 12.0,
                                      spreadRadius: 2.0)
                                ],
                              ),
                              child: Visibility(
                                visible: true,
                                child: Center(
                                  child: Text(
                                    'BOBEOU, DANÇOU',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ),
              Visibility(
                visible: mensageVisibility,
                child: Container(
                  width: double.infinity,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xffe84a5f),
                  ),
                  child: Center(
                    child: Text(
                      menssagem.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Visibility(
                    visible: lotContainerVisibility,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          amountPlayerCards++;
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffc06c84),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 12.0,
                                spreadRadius: 2.0)
                          ],
                        ), // BoxDecoration
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: startGameButton,
                    child: RaisedButton(
                      onPressed: () {
                        startGame();
                      },
                      color: Color(0xffe84a5f),
                      child: Text(
                        menssagemNoBotao,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedCardVisibility,
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedCardBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 12.0,
                              spreadRadius: 2.0)
                        ],
                      ), // BoxDecoration
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            selectedCardContent,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ), // TextStyle
                          ), // Text
                          Text(
                            selectedCardContent.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ), // TextStyle
                          ), // Text
                          Text(
                            selectedCardContent,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: turnButtonVisibility,
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        changeTurnPlayer();
                      },
                      color: Color(0xffe84a5f),
                      child: Text(
                        'Passar a vez',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: playerCardsVisibility,
                child: SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: amountPlayerCards,
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                getSelectedPlayerCard(playerCards[index]);
                                playerCards.removeAt(index);
                                amountPlayerCards--;
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: playerCards[index].backgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                        blurRadius: 12.0,
                                        spreadRadius: 2.0)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      playerCards[index].content,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      playerCards[index].content.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      playerCards[index].content,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
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
