import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    _itens = [];
    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item['titulo'] = "Titulo ${i}";
      item['descricao'] = "Descrição ${i}";
      _itens.add( item );

    }

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){

              //Map<String, dynamic> item = _itens[indice];
              //print("Item ${ _itens[indice].toString() }");
              //print("Item ${ item['titulo'] }");
              //print("Item ${ _itens[indice]["titulo"] }");

              return ListTile(

                onTap: (){
                  //print("ON tap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context){


                        /* ============================== Base
                        return AlertDialog(
                          title: Text("Titulo"),
                          content: Text("Conteudo"),
                        );
                         */

                        return AlertDialog(
                          title: Text( _itens[indice]["titulo"] ),
                          titlePadding: EdgeInsets.all(50),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                          ),
                          content: Text( _itens[indice]["descricao"] ),
                          //contentPadding: EdgeInsets.all(80),
                          //contentTextStyle: TextStyle(),
                          //backgroundColor: Colors.white,
                          actions: <Widget>[
                            FlatButton(
                                onPressed: (){
                                  print("Selecionado sim ...");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            )

                          ],
                        );

                      }
                  );
                },

                /*
                onLongPress: (){
                  print("On long ");
                },
                 */

                //title: Text( indice.toString() ),
                title: Text( _itens[indice]["titulo"] ),

                //subtitle: Text("subtitulo"),
                subtitle: Text(_itens[indice]["descricao"]),

              );

            }
        )
      ),
    );
  }
}
