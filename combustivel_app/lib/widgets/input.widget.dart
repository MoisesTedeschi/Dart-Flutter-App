import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var label = "";
  var ctrl = new MoneyMaskedTextController();

  //Construtor da Classe
  Input({
    @required this.label,
    @required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 142,
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Solo",
            ),
          ),
        ),
        SizedBox(
          width: 110,
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: "R\$ ",
              prefixStyle: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: "Solo",
              ),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              //enabledBorder: OutlineInputBorder(
              //  borderSide: BorderSide(color: Colors.deepPurple[300]),
              //),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Biko",
            ),
            controller: ctrl,
          ),
        ),
      ],
    );
  }
}
