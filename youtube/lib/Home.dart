import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricoes.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()

      //Text("Inicio"),
      //Text("Em alta"),
      //Text("Inscrições"),
      //Text("Biblioteca"),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor:  Colors.white,
        title: Image.asset(
            "imagens/youtube.png",
            width: 98,
            height: 22,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
              //print(res);
            },
          )

          /*
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
              );
            },
          )
           */

          /*
          IconButton(
              icon: Icon(Icons.videocam), 
              onPressed: (){
                print("Ação : vidiocam !");
              },
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print("Ação : pesquisa !");
              },
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                print("Ação : conta !");
              },
          )
          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting , // até 3 icons usa cores backgound
        currentIndex: _indiceAtual,
        onTap: (indice){
            setState(() {
              _indiceAtual = indice;
            });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
