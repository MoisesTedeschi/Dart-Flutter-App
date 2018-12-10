import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//Fazendo a requisição ao HG Finance
const request = "https://api.hgbrasil.com/finance?format=json&key=b6380d87";

void main() async{
  //Retorna o futuro do MAP
  //print(await getData());

  runApp(MaterialApp(
    home: Home(),
  ));
}

//Retorna um dado futuro para a requisição - Um MAP no futuro.
Future<Map> getData() async{

  //Adiciona a resposta do servidor na variável "response", mas espera a resposta.
  //await - Espera os dados chegarem e manda para a variável.
  http.Response response = await http.get(request);

  //Pega a resposta da requisição e transforma em um MAP.
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      //Vai construir a tela dependendo do que tiver no "getData()".
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text("Carregando Dados",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0),
                    textAlign: TextAlign.center,)
                );
              default:
                if(snapshot.hasError){
                  return Center(
                      child: Text("Erro ao Carregar Dados :(",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25.0),
                        textAlign: TextAlign.center,)
                  );
                }else{
                  return Container(color: Colors.green,);
                }
            }
          })
    );
  }
}
