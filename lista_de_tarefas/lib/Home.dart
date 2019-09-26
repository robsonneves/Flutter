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

  @override
  Widget build(BuildContext context) {

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
                itemBuilder: (context, index){

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

                  /*
                  return ListTile(
                    title: Text(_listaTarefa[index]['titulo']),
                  );
                  */

                },
              )
          )
        ],
      )
    );
  }
}
