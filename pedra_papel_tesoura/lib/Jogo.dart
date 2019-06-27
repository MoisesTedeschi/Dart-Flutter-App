import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemAPP = AssetImage("images/padrao-new.png");
  var _mensagem = "Faça sua jogada. Esolha:";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["Pedra", "Papel", "Tesoura"];
    var numero = Random().nextInt(3);

    var escolaAPP = opcoes[numero];

    //Teste de escolha
    /*
    print("Escolha do APP: $escolaAPP");
    print("Escolha do Usuário: $escolhaUsuario");
    */

    switch( escolaAPP ){
      case "Pedra" :
        setState(() {
          this._imagemAPP = AssetImage("images/pedra-new.png");
        });
        break;

      case "Papel" :
        setState(() {
          this._imagemAPP = AssetImage("images/papel-new.png");
        });
        break;

      case "Tesoura" :
        setState(() {
          this._imagemAPP = AssetImage("images/tesoura-new.png");
        });
        break;
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "JoKenPo",
            textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.amber[700],
      ),
      body: Column(
        //Alinhamento de Elementos do App
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Text(
              "O oponente escolheu:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Image(image: this._imagemAPP, height: 100,),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16.0),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("Pedra"),
                child: Image.asset("images/pedra-new.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Papel"),
                child: Image.asset("images/papel-new.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Tesoura"),
                child: Image.asset("images/tesoura-new.png", height: 100,),
              ),
              /*
              Image.asset("images/pedra.png", height: 100,),
              Image.asset("images/papel.png", height: 100,),
              Image.asset("images/tesoura.png", height: 100,),
              */
            ],
          ),

        ],
      ),
    );
  }
}
