import 'package:flutter/material.dart';
import 'resultadoQuiz.dart';
import 'dart:async';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Questao> questoes = [
    Questao(1, 2, 'Minha mãe ___________um carro.', false),
    Questao(2, 1, 'Ana _______________com vocês?', false),
    Questao(3, 4, '__________para as apresentações?', false),
    Questao(4, 1, 'O Roberto ___________hoje cedo.', false),
    Questao(5, 3, 'Você ____________ontem?', false),
    Questao(6, 2, 'Por que você se __________tanto?', false),
    Questao(7, 4, 'O meu relógio ____________.', false),
    Questao(8, 1, 'O meu despertador não __________.', false),
    Questao(9, 2, 'O que você _________para a sua mãe?', false),
    Questao(10, 1, 'O João _________com vocês?', false),
  ];

  List<Botao> botoes = [
    Botao(1, 1, 'comprô', Color(0xFF2a363b)),
    Botao(1, 2, 'comprou', Color(0xFF2a363b)),
    Botao(1, 3, 'conprou', Color(0xFF2a363b)),
    Botao(1, 4, 'compro', Color(0xFF2a363b)),
    Botao(2, 1, 'voltou', Color(0xFF2a363b)),
    Botao(2, 2, 'voltô', Color(0xFF2a363b)),
    Botao(2, 3, 'voutou', Color(0xFF2a363b)),
    Botao(2, 4, 'vouto', Color(0xFF2a363b)),
    Botao(3, 1, 'Pesquisô', Color(0xFF2a363b)),
    Botao(3, 2, 'Pesquizou', Color(0xFF2a363b)),
    Botao(3, 3, 'Pesquizo', Color(0xFF2a363b)),
    Botao(3, 4, 'Pesquisou', Color(0xFF2a363b)),
    Botao(4, 1, 'chegou', Color(0xFF2a363b)),
    Botao(4, 2, 'chegô', Color(0xFF2a363b)),
    Botao(4, 3, 'chegol', Color(0xFF2a363b)),
    Botao(4, 4, 'chego', Color(0xFF2a363b)),
    Botao(5, 1, 'viajol', Color(0xFF2a363b)),
    Botao(5, 2, 'viajô', Color(0xFF2a363b)),
    Botao(5, 3, 'viajou', Color(0xFF2a363b)),
    Botao(5, 4, 'viagou', Color(0xFF2a363b)),
    Botao(6, 1, 'atrasô', Color(0xFF2a363b)),
    Botao(6, 2, 'atrasou', Color(0xFF2a363b)),
    Botao(6, 3, 'atrazô', Color(0xFF2a363b)),
    Botao(6, 4, 'atrazou', Color(0xFF2a363b)),
    Botao(7, 1, 'quebro', Color(0xFF2a363b)),
    Botao(7, 2, 'quebrô', Color(0xFF2a363b)),
    Botao(7, 3, 'quebrol', Color(0xFF2a363b)),
    Botao(7, 4, 'quebrou', Color(0xFF2a363b)),
    Botao(8, 1, 'tocou', Color(0xFF2a363b)),
    Botao(8, 2, 'tocô', Color(0xFF2a363b)),
    Botao(8, 3, 'tocol', Color(0xFF2a363b)),
    Botao(8, 4, 'toco', Color(0xFF2a363b)),
    Botao(9, 1, 'falô', Color(0xFF2a363b)),
    Botao(9, 2, 'falou', Color(0xFF2a363b)),
    Botao(9, 3, 'falow', Color(0xFF2a363b)),
    Botao(9, 4, 'falo', Color(0xFF2a363b)),
    Botao(10, 1, 'passeou', Color(0xFF2a363b)),
    Botao(10, 2, 'passeô', Color(0xFF2a363b)),
    Botao(10, 3, 'passeo', Color(0xFF2a363b)),
    Botao(10, 4, 'pasceou', Color(0xFF2a363b)),
  ];

  int contadorQuestoes = 0;
  int contadorQuestoes1 = 0;
  int contadorBotoes = 0;

  int contadorAcertos = 0;

  int mudaQuestao = 0;

  Timer contador;

  checarValorOpcao(int opcaoEscolhida, int idQuestao) {
    if(contadorQuestoes <= 9) {
      setState((){
        for(int i = 0; i <= botoes.length - 1; i++) {
          botoes[i].corFundo = Color(0xffe84a5f);
        }
        botoes[questoes[idQuestao - 1].opcaoCorreta - 1 + mudaQuestao].corFundo = Color(0xff99b898);
        mudaQuestao += 4;
      });
    }

    if(opcaoEscolhida == questoes[idQuestao - 1].opcaoCorreta) {
      contadorAcertos++;
      questoes[idQuestao - 1].stateQ = true;
    }

    contadorQuestoes1++;

    contador = Timer(
        Duration (milliseconds: 2000),
            () {
          limpaCorBotoes();
          if(contadorQuestoes1 == 10) {
            contador = Timer (
              Duration (milliseconds: 2000),
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultQuiz(contadorAcertos))
                  );
                }
            );
          }
        }
    );
  }

  limpaCorBotoes() {
    if(contadorQuestoes <= 8) {
      setState((){
        for(int j = 0; j <= botoes.length - 1; j++) {
          botoes[j].corFundo = Color(0xFF2a363b);
        }
        contadorQuestoes++;
        contadorBotoes +=4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF355c7d),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffe84a5f),
        title: Text(
          "Questão ${questoes[contadorQuestoes].idQuestao}",
          style: TextStyle(
            color: Colors.white,
          ), // TextStyle
        ), // Text
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 260,
                height: 260,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff6c5b7b),
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
                    questoes[contadorQuestoes].conteudo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ), // TextStyle
                  ), // Text
                ), // Center
              ), // Container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      checarValorOpcao(
                        botoes[contadorBotoes].opcao,
                        botoes[contadorBotoes].idQuestao,
                      );
                    },
                    color: botoes[contadorBotoes].corFundo,
                    child: Text(
                      botoes[contadorBotoes].conteudo,
                      style: TextStyle(
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                  ), // RaisedButton
                  RaisedButton(
                    onPressed: () {
                      checarValorOpcao(
                        botoes[contadorBotoes + 1].opcao,
                        botoes[contadorBotoes + 1].idQuestao,
                      );
                    },
                    color: botoes[contadorBotoes + 1].corFundo,
                    child: Text(
                      botoes[contadorBotoes + 1].conteudo,
                      style: TextStyle(
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                  ), // RaisedButton
                ], // <Widget>[]
              ), // Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      checarValorOpcao(
                        botoes[contadorBotoes + 2].opcao,
                        botoes[contadorBotoes + 2].idQuestao,
                      );
                    },
                    color: botoes[contadorBotoes + 2].corFundo,
                    child: Text(
                      botoes[contadorBotoes + 2].conteudo,
                      style: TextStyle(
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                  ), // RaisedButton
                  RaisedButton(
                    onPressed: () {
                      checarValorOpcao(
                        botoes[contadorBotoes + 3].opcao,
                        botoes[contadorBotoes + 3].idQuestao,
                      );
                    },
                    color: botoes[contadorBotoes + 3].corFundo,
                    child: Text(
                      botoes[contadorBotoes + 3].conteudo,
                      style: TextStyle(
                        color: Colors.white,
                      ), // TextStyle
                    ), // Text
                  ), // RaisedButton
                ], // <Widget>[]
              ), // Row
            ], // <Widget>[]
          ), // Column
        ), // Container
      ), // Center
    ); // Scaffold
  }
}

class Questao {
  int idQuestao;
  int opcaoCorreta;
  dynamic conteudo;
  bool stateQ;

  Questao(this.idQuestao, this.opcaoCorreta, this.conteudo, this.stateQ);
}

class Botao {
  int idQuestao;
  int opcao;
  dynamic conteudo;
  Color corFundo;

  Botao(this.idQuestao, this.opcao, this.conteudo, this.corFundo);
}