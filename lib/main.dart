import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


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

  Helper helper = Helper(); 
  
  List<Icon> marcadorDePontos= [];

  void conferirResposta(bool respostaSelecionada){
    setState(() {
      //TODO: Passo 4 - Use o IF/ELSE para verificar se chegou-se ao fim do quiz. Se isso for verdadeiro (true), siga os passos: 4.a, 4.b, 4.c e 4.d
      //TODO: Passo 4.a) - Mostre um alerta utilizando o pacote rflutter_alert (se ficar em dúvida dê uma olhada na documentação do pacote: https://pub.dev/packages/rflutter_alert).
      //TODO: Passo 4.c) - Reinicie o valor da propriedade _numeroDaQuestaoAtual.
      //TODO: Passo 4.d) - Esvazie a lista marcadorDePontos para uma nova rodada.
      //TODO: Passo 5 - 'Se' não for o fim da execução do app ainda, ou seja, se não estivermos na última questão,entre na estrutura condicional e continue com a verificação da resposta.

    bool resultado = helper.obterResposta();
                  
      if (resultado == respostaSelecionada) {
        marcadorDePontos.add(Icon(Icons.check, color: Colors.greenAccent)); 
      } else 
       { marcadorDePontos.add(Icon(Icons.close, color: Colors.redAccent)); 
        };
          

      if(helper.confereFimDaExecucao() == true){
        Alert(
          context: context,
          title: "FIM DO QUIZ",
          desc: "Flutter is awesome.").show();

        helper.resetar();
        marcadorDePontos.clear();


      } else{
        helper.proximaPergunta();
      }

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
                conferirResposta(false);
              
              },
              ),
            ),
        ),
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
