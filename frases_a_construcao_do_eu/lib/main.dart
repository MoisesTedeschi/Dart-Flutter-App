import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Definição de Variáveis do APP
  var _frases = [
    "\"Obstáculos e dificuldades fazem parte da vida. E a vida é a arte de "
        "superá-los.\" (Mestre DeRose)",
    "\"Sem paz interior, sem calma interior, é difícil encontrar uma paz "
        "duradoura.\" (Dalai Lama)",
    "\"Não existe progresso na direção da liberdade suprema sem transformação, "
        "e esse é o ponto fundamental na vida das pessoas, sejam elas "
        "praticantes de yoga, ou não.\" (Iyengar)",
    "\"A luta ansiosa pela felicidade é o que dá infelicidade a muita gente.\" (Hermógenes)"
  ];
  var _fraseGerada = "Clique para gerar uma nova frase!";

  void _gerarFrase(){
    // Gerando Números randomicos para randomizar as frases.
    var numeroRanomico = Random().nextInt( _frases.length + 1 );

    // Print de teste no console.
    // print(numeroRanomico);

    // Método Set altera o estado da tela - Se não utilizado as frase não vão mudar.
    setState(() {
      // A variável vai receber uma nova frase com base no valor gerado do random.
      // O indice da frase vem do random.
      _fraseGerada = _frases[ numeroRanomico ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases - A Construção do Eu"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        // Definindo largura do container
        width: double.infinity,

        // Definição de borda para design - teste.
        /*decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.pink),
        ),*/

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                "images/logo-frases.png",
                width: 140,
            ),
            Text(
              _fraseGerada,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                color: Colors.pink,
              ),
            ),
            RaisedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.pink,
              onPressed: _gerarFrase,
            ),

          ],
        ),
      ),
    );
  }
}
