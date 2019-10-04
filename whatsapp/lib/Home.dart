import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Login.dart';
import 'package:whatsapp/telas/AbaContatos.dart';
import 'package:whatsapp/telas/AbaConversas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _tabController;
  List<String> _itensMenu = [
    "Configurações", "Deslogar"
  ];
  String _emailUsuario = "";

  Future _recuperarDadosUsuario() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();

    //auth.signOut();
    setState(() {
      _emailUsuario = usuarioLogado.email;
    });

  }

  _escolhaMenuItem(String itemEscolhido){

    switch( itemEscolhido ){
      case 'Configurações' :  Navigator.pushNamed(context, "/configuracoes");
        break;
      case 'Deslogar' : _deslogarUsuario();
        break;

    }

    print("Item escolhido ${itemEscolhido}");

  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");

    /*
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => Login()
      )
    );
    */

  }

  Future _verificarUsuarioLogado() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();

    if(usuarioLogado == null){
      Navigator.pushReplacementNamed(context, "/login");
    }

  }

  @override
  void initState(){
    super.initState();
    _verificarUsuarioLogado();
    _recuperarDadosUsuario();
    _tabController = TabController(
        length: 2,
        vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: Platform.isIOS ? 0 : 4,
        bottom: TabBar(
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          indicatorColor: Platform.isIOS ? Colors.grey[200] : Colors.white,
          tabs: <Widget>[
            Tab(text: "Conversas",),
            Tab(text: "Contatos",)
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context){
              return _itensMenu.map((String item){
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          AbaConversas(),
          AbaContatos()
        ],
      )
    );
  }
}
