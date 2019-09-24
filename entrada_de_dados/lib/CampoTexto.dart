import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrada de dados.'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //keyboardType: TextInputType.text,
              //keyboardType: TextInputType.number,
              //keyboardType: TextInputType.emailAddress,
              //keyboardType: TextInputType.datetime,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite um valor'
              ),
              //enabled: true,
              //enabled: false,
              //maxLength: 2,
              //maxLengthEnforced: false,
              style: TextStyle(
                fontSize: 25,
                color: Colors.green
              ),
              //obscureText: true,
              /*
              onChanged: (String e){
                print('Valor digitado ' + e);
              },
              */

              onSubmitted: (String e){
                print("Valor é " + e);
              },
              controller: _textEditingController,

            ),
          ),
          RaisedButton(
            child: Text('Salvar'),
            color: Colors.lightGreen,
            onPressed: (){
              print("Valor digitado " + _textEditingController.text);
            },
          )
        ],
      )
    );
  }
}
