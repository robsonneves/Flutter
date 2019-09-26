import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      body: Text("Conteudo"),
      // local do btn
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      // tem que ter o buttom
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.purple, // cor do btn
          //foregroundColor: Colors.red, // cor do icone no btn
          foregroundColor: Colors.white,
          elevation: 6, //sombra
          //mini: true, // tamanho do btn

          icon: Icon(Icons.add_shopping_cart),
          label: Text("Adicionar"),

          /*
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          */

          /*
          child: Icon(Icons.add),
          onPressed: (){
            print("Resultado btn precionado!");
          }
          */

      ),
      //bottomNavigationBar: BottomNavigationBar(items: null,),
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), // contorna a barra
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){}
            )
          ],
        ),
      )
    );
  }
}
