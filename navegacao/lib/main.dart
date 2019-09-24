import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/secundaria' : (context) => TelaSecundaria()
      //'/outraRota' : (context) => TelaSecundaria()
    },
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal."),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para segunda tela."),
              padding: EdgeInsets.all(15),
              onPressed: (){

                Navigator.pushNamed(context, '/secundaria');

                /*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => TelaSecundaria("Pedro") obrigatorio
                      builder: (context) => TelaSecundaria(valor: "Pedro")
                    )
                );
                */

              },
            )
          ],
        ),
      ),
    );
  }
}
