import 'dart:io' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  TextEditingController _controllerNome = TextEditingController();
  File _imagem;
  String _idUsuarioLogado;
  bool _subindoImagem = false;
  String _urlImagemRecuperada;

  Future _recuperarImagem(String origemDaImagem) async {

    File imagemSelecionada;
    switch( origemDaImagem ){
      case "camera":
        print("Camera");
        //imagemSelecionada =
          //await ImagePicker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        print("Galeria");
        //imagemSelecionada =
          //await ImagePicker.pickImage(source: ImageSource.gallery);
      break;
    }

    setState(() {
      _imagem = imagemSelecionada;
      if( _imagem != null){
        _subindoImagem = true;
        _uploadImagem();
      }
    });

  }

  Future _uploadImagem(){
    
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("perfil").child(_idUsuarioLogado+".jpg");

    StorageUploadTask task = arquivo.putFile(_imagem);
    task.events.listen((StorageTaskEvent storageEvent){
      if( storageEvent.type == StorageTaskEventType.progress ){
        setState(() {
          _subindoImagem = true;
        });
      }else if( storageEvent.type == StorageTaskEventType.success ){
        setState(() {
          _subindoImagem = false;
        });
      }
    });

    task.onComplete.then(( StorageTaskSnapshot snapshot){
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {

    String url = await snapshot.ref.getDownloadURL();
    _atualizarUrlImagemFirestore( url );

    setState(() {
      _urlImagemRecuperada = url;
    });

  }

  _atualizarNomeFirestore(){
  //_atualizarNomeFirestore(String nome){
    String nome = _controllerNome.text;
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtualizar = {
      "nome" : nome
    };
    db.collection("usuarios")
        .document(_idUsuarioLogado)
        .updateData( dadosAtualizar );
  }

  _atualizarUrlImagemFirestore(String url){
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtualizar = {
      "urlImagem" : url
    };
    db.collection("usuarios")
      .document(_idUsuarioLogado)
      .updateData( dadosAtualizar );
  }

  _recuperarDadosUsuario() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuarioLogado = usuarioLogado.uid;

    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios")
        .document( _idUsuarioLogado ).get();

    Map<String, dynamic> dados = snapshot.data;
    _controllerNome.text = dados["nome"];

    if( dados["urlImagem"] != null ){
      _urlImagemRecuperada = dados["urlImagem"];
    }

  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
             child: Column(
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.all(16),
                   child: _subindoImagem ? CircularProgressIndicator() : Container(),
                 ),
                 CircleAvatar(
                   radius: 100,
                   backgroundImage:
                    _urlImagemRecuperada != null
                        ? NetworkImage(_urlImagemRecuperada)
                        //: null,
                        : NetworkImage("https://firebasestorage.googleapis.com/v0/b/whatsapp-4a521.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=f3a8d230-8e84-4a40-9385-069b6f3b2f91"),
                   backgroundColor: Colors.grey,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     FlatButton(
                       child: Text("Câmera"),
                       onPressed: (){
                         _recuperarImagem("camera");
                       },
                     ),
                     FlatButton(
                       child: Text("Galeria"),
                       onPressed: (){
                         _recuperarImagem("galeria");
                       },
                     )
                   ],
                 ),
                 Padding(
                   padding: EdgeInsets.only(bottom: 8),
                   child: TextField(
                     controller: _controllerNome,
                     //autofocus: true,
                     keyboardType: TextInputType.text,
                     style:  TextStyle(
                         fontSize: 20
                     ),
                     /*
                     onChanged: (texto){
                       _atualizarNomeFirestore(texto);
                     },
                     */
                     decoration: InputDecoration(
                         contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                         hintText: "Nome",
                         filled: true,
                         fillColor: Colors.white,
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(32)
                         )
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 16, bottom: 10),
                   child: RaisedButton(
                     child: Text(""
                         "Salvar",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20
                       ),
                     ),
                     color: Colors.green,
                     padding:  EdgeInsets.fromLTRB(32, 16, 32, 16),
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(32)
                     ),
                     onPressed: (){
                       _atualizarNomeFirestore();
                     },
                   ),
                 ),
               ],
             ),
          ),
        ),
      ),
    );
  }
}
