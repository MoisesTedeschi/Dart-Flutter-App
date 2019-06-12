import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Frases - A Construção do Eu",

      home: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
  ));
}