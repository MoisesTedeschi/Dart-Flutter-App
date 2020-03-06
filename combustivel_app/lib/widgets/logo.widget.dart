import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
          child: Image.asset(
            "assets/img/oil-price-white.png",
            height: 102,
          ),
        ),
        Text(
          "ÁLCOOL OU GASOLINA?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Biko",
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
