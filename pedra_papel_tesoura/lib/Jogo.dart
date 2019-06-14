import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemAPP = AssetImage("images/padrao.png");

  void opcaoSelecionada(String escolhaUsuario){



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "JoKenPo - Pedra, Papel e Tesoura",
            textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        //Alinhamento de Elementos do App
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Text(
              "Ecolha do Oponente",
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
              "Escolha uma opção abaixo",
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
                onTap: () => opcaoSelecionada("Pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("Papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("Tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
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
