import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Post.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuparaPostagens() async {

    http.Response response = await http.get( _urlBase + "/posts" );
    var dadosJson = json.decode( response.body );

    List<Post> postagens = List();
    for(var post in dadosJson){
      print(post['title']);
      Post p = Post(post['userID'], post['id'], post['title'], post['body']);
      postagens.add(p);
    }

    return postagens;
    
  }

  _post() async {

    Post post = Post(120, null, 'Titulo', 'Corpo da mensagem');
    var corpo = json.encode(post.toJson());

    /*
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": "Titulo",
      "body": "Corpo da postage"
    });
    */

    http.Response response = await http.post(
      _urlBase + "/posts",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta : ${response.statusCode }" );
    print("resposta : ${response.body }" );

  }

  _put() async{

    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": "Titulo alterado",
      "body": "Corpo da postage alterada"
    });

    http.Response response = await http.put(
      _urlBase + "/posts/2",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta : ${response.statusCode }" );
    print("resposta : ${response.body }" );

  }

  _path() async {

    var corpo = json.encode({
      "userId": 120,
      "body": "Corpo da postage alterada com path"
    });

    http.Response response = await http.patch(
      _urlBase + "/posts/2",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta : ${response.statusCode }" );
    print("resposta : ${response.body }" );

  }

  _delete() async{

    http.Response response = await http.delete(
        _urlBase + "/posts/2"
    );

    if(response.statusCode == 200){
      //sucesso
    }else{
      //erro ao tentar deletar item
    }


    print("resposta : ${response.statusCode }" );
    print("resposta : ${response.body }" );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço Avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _put,
                ),
                RaisedButton(
                  child: Text("Deletar"),
                  onPressed: _delete,
                )
              ],
            )
            ,Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Path"),
                  onPressed: _path,
                )
              ],
            ),


            Expanded(
                child: FutureBuilder<List<Post>>(
                  future: _recuparaPostagens(),
                  builder: (context, snapshot){

                    switch(snapshot.connectionState){
                      case ConnectionState.none :

                      case ConnectionState.waiting :
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;

                      case ConnectionState.active :

                      case ConnectionState.done :
                        print("Conexão done !");
                        if( snapshot.hasError ){
                          print("Erro ao carregar !");
                        }else{
                          print("Carregou !");
                          return ListView.builder(
                              itemBuilder: (context, indice){

                                List<Post> lista = snapshot.data;
                                Post post = lista[indice];

                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.id.toString()),
                                );
                              }
                          );
                        }
                        break;
                    }
                    return null;
                  },
                ),
            )


          ],
        ),
      )
    );
  }

}

