import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDeDados() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados   = join(caminhoBancoDados, 'banco.db');

    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);
      }
    );

    //print("Aberto " + bd.isOpen.toString() );
    return bd;

  }

  _salvar() async{

    Database bd = await _recuperarBancoDeDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "zurich destefanno",
      "idade": 46

    };

    int id = await bd.insert("usuarios", dadosUsuario);

    print("Salvo id : ${id}");

  }

  _listarUsuarios() async {

    Database bd = await _recuperarBancoDeDados();

    //String sql = "SELECT * FROM usuarios";
    //String sql = "SELECT nome FROM usuarios";
    //String sql = "SELECT * FROM usuarios WHERE idade = 58";
    //String filtro = "dr";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%"+ filtro + "%' ";
    //String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC";

    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);

    for(var usuario in usuarios){
      print(
          "Item id : " + usuario['id'].toString() +
          "Nome : " + usuario['nome'] +
          "Idade : " + usuario['idade'].toString()
      );
    }

    //print("Usuarios : " + usuarios.toString() );

  }

  _listarUsuarioId(int id) async{

    Database bd = await _recuperarBancoDeDados();
    List usuarios = await bd.query(
      "usuarios",
      columns: ['id', 'nome', 'idade'],
      where: "id = ? ",
      whereArgs: [id]
    );

    for(var usuario in usuarios){
      print(
          "Item id : " + usuario['id'].toString() +
              "Nome : " + usuario['nome'] +
              "Idade : " + usuario['idade'].toString()
      );
    }
  }

  _excluirUsuario(int id) async {

    Database bd = await _recuperarBancoDeDados();
    int retorno = await bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

    print("Item quantidade excluida : $retorno ");

  }

  _atualizarUsuario(int id) async {

    Database bd = await _recuperarBancoDeDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Pedro",
      "idade": 22
    };

    int retorno = await bd.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id]
    );

    print("Item quantidade atualizada : $retorno ");

  }

  @override
  Widget build(BuildContext context) {

    _listarUsuarioId(1);
    _atualizarUsuario(1);
    _listarUsuarioId(1);
    // _listarUsuarioId(3);
    //_excluirUsuario(2);
    //_listarUsuarios();
    //_salvar();
    //_recuperarBancoDeDados()

    return Container();
  }
}

