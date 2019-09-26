import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          }
      )
      /*
      IconButton(
          icon: Icon(Icons.done),
          onPressed: (){}
      )
       */
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            close(context, "");
          }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("Resultado pesquisa sendo realizada !");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return Container();


    //print("Resultado pesquisa sendo realizada !" + query);
    //return Container();



    /*
    List<String> lista = List();

    if(query.isNotEmpty){

      lista = [
        "Android", "Android navegação", "IOS", "Jogos" 
      ].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                //close(context, index.toString());
                close(context, lista[index] );
              },
              title: Text(lista[index]),
            );
          }
      );

    }else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa ! "),
      );
    }
    */

  }


}