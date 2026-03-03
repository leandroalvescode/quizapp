import 'package:flutter/material.dart';
import 'helper.dart';

Helper helper = Helper();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> marcadorDePontos= [];

  void conferirResposta(bool respostaSelecionada){
    setState(() {
                  bool resultado = helper.obterResposta();
                  
                  if (resultado == respostaSelecionada) {
                    marcadorDePontos.add(Icon(Icons.check, color: Colors.greenAccent)); 
                  } else{
                    marcadorDePontos.add(Icon(Icons.close, color: Colors.redAccent)); 
                  };
                  
                   helper.proximaPergunta();
                });
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(helper.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple.shade800,
              ) ,
              
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //O usuário clica no botão verdadeiro.
                  conferirResposta(true);
               
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
              ) ,

              child: Text(
                'Falso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //O usuário clica no botão falso.
                conferirResposta(false);
              
              },
              ),
            ),
        ),
        //TODO: Adicionar uma Row aqui para o marcador de pontos.
        Row(children:marcadorDePontos)
      ],
    );
  }
}

/*
pergunta1: 'O metrô é um dos meios de transporte mais seguros do mundo', verdadeiro,
pergunta2: 'A culinária brasileira é uma das melhores do mundo.', verdadeiro,
pergunta3: 'Vacas podem voar, assim como peixes utilizam os pés para andar.', falso,
*/
