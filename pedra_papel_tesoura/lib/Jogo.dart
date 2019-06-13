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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Text("Escolha do App"),
          Image.asset(
            //Caminho da imagem
            //Tamanho da imagem

          ),
          //Texto de Resoltado
          //Linha com opções

        ],
      ),
    );
  }
}
