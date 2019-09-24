import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  String valor;

  //TelaSecundaria(this.valor);
  //TelaSecundaria({this.valor}); passar valor opcional
  TelaSecundaria({this.valor});

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();

}

class _TelaSecundariaState extends State<TelaSecundaria> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria."),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            //Text("Segunda tela! Valor passado : ${widget.valor} .")
            Text("Segunda tela! Valor passado :"),
            RaisedButton(
              child: Text("Ir para primeira tela."),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
    );
  }
}
