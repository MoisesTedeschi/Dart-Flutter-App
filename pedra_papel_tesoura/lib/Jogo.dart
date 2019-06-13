import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo - Pedra, Papel e Tesoura"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        //Alinhamento de Elementos do App
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 16.0),
            child: Text(
              "Ecolha do Oponente",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Image.asset("images/padrao.png"),

        ],
      ),
    );
  }
}
