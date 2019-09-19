import 'package:flutter/material.dart';
import 'package:my_project/screens/lista_transferencia.dart';

void main() => runApp(my_project());

class my_project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: ListaTransferencia()
    );
  }
}

//class ListaTransferencia extends Widget{
//class ListaTransferencia extends StatefulWidget{  StatefulWidget conteudo dinamico que muda




