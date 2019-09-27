import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefa = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();

  TextEditingController _controllerTarefa = TextEditingController();

   Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa(){

     String textoDigitado = _controllerTarefa.text;

     Map<String, dynamic> tarefa = Map();
     tarefa["titulo"] = textoDigitado;
     tarefa["realizada"] = false;

     setState(() {
      _listaTarefa.add(tarefa);
     });

     _salvarArquivo();
     _controllerTarefa.text = "";

  }

  _salvarArquivo() async {

    var arquivo = await _getFile();

    String dados =  json.encode(_listaTarefa);
    arquivo.writeAsString(dados);

  }

  _lerArquivo() async {
    try{
      var arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      //e.toString();
      return null;
    }
  }

  @override
  void initState() {

     super.initState();

    _lerArquivo().then((dados){
      setState(() {
        _listaTarefa = jsonDecode(dados);
      });
    });

  }

  Widget criarItemLista(context, index){

    //final item = _listaTarefa[index]["titulo"]; //+ _listaTarefa[index]["realizada"].toString();

    return Dismissible(
        key: Key( DateTime.now().microsecondsSinceEpoch.toString() ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){

          //recuperar ultimo item excluido
          _ultimaTarefaRemovida = _listaTarefa[index];

          //remover da lista
          _listaTarefa.removeAt(index);
          _salvarArquivo();

          //snachbar
          final snackbar = SnackBar(
            //backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
            content: Text("Tarefa removida"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: (){
                setState(() {
                  _listaTarefa.insert(index, _ultimaTarefaRemovida);
                });
                _salvarArquivo();
              },
            ),
          );
          
          Scaffold.of(context).showSnackBar(snackbar);
          
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
        child: CheckboxListTile(
          title: Text(_listaTarefa[index]['titulo']),
          value: _listaTarefa[index]['realizada'],
          onChanged: (valorAlterado){
            setState(() {
              _listaTarefa[index]['realizada'] = valorAlterado;
            });
            _salvarTarefa();
          },
        )
    );

  }

  @override
  Widget build(BuildContext context) {

    //print("items: " + DateTime.now().microsecondsSinceEpoch.toString() );

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas ..."),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: (){

          showDialog(
            context: context,
            builder: (context){

              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(
                    labelText: "Digite sua terafa."
                  ),
                  onChanged: (text){
                    
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancelar"),
                  ),
                  FlatButton(
                    onPressed: (){
                      _salvarTarefa();
                    },
                    child: Text("Salvar"),
                  )
                ],
              );

            }
          );

        }
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                itemCount: _listaTarefa.length,
                itemBuilder: criarItemLista /*(context, index){

                  return CheckboxListTile(
                    title: Text(_listaTarefa[index]['titulo']),
                    value: _listaTarefa[index]['realizada'],
                    onChanged: (valorAlterado){
                      setState(() {
                        _listaTarefa[index]['realizada'] = valorAlterado;
                      });
                      _salvarTarefa();
                    },
                  );
                  */

                  /*
                  return ListTile(
                    title: Text(_listaTarefa[index]['titulo']),
                  );
                  */

                //},
              ),
          )
        ],
      )
    );
  }
}
