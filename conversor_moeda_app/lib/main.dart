import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//Fazendo a requisição ao HG Finance
const request = "https://api.hgbrasil.com/finance?format=json&key=b6380d87";

void main() async {
  //Retorna o futuro do MAP
  //print(await getData());

  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
  ));
}

//Retorna um dado futuro para a requisição - Um MAP no futuro.
Future<Map> getData() async {
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

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _realChanged(String text){
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }
  void _dolarChanged(String text){
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }
  void _euroChanged(String text){
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

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
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                      child: Text(
                    "Carregando Dados",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "Erro ao Carregar Dados :(",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
                  } else {
                    //Retornando valores do servidor.
                    dolar =
                        snapshot.data["results"]["currencies"]["USD"]["buy"];
                    euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(Icons.monetization_on,
                              size: 150.0, color: Colors.amber),

                          buildTextField("Reais", "R\$ ", realController, _realChanged),

                          Divider(),

                          buildTextField("Dólares", "U\$ ", dolarController, _dolarChanged),

                          Divider(),

                          buildTextField("Euros", "€ ", euroController, _euroChanged)

                        ],
                      ),
                    );
                  }
              }
            }));
  }
}

//Otimizando Campos de Texto
Widget buildTextField(String label, String prefix, TextEditingController controlConverse, Function funcModification){
  return TextField(

    controller: controlConverse,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
    onChanged: funcModification,

    //Inserir apenas números no input
    keyboardType: TextInputType.number,
  );
}
