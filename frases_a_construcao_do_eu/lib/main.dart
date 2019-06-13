import 'package:flutter/material.dart';

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
            Image.asset("images/logo-frases.png"),
            Text(
              "Clique para gerar uma nova frase!",
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
              onPressed: (){},
            ),

          ],
        ),
      ),
    );
  }
}
