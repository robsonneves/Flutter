import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';

import 'Home.dart';
import 'model/Usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos(){

    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if( email.isNotEmpty ){
      if( senha.isNotEmpty ){
        setState(() {
          _mensagemErro = "";
        });

        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;

        _logarUsuario(usuario);

      }else{
        setState(() {
          _mensagemErro = "Preencha a senha ...";
        });
      }
    }else{
      setState(() {
        _mensagemErro = "Preencha o E-mail utilizando @ ...";
      });
    }

  }

  _logarUsuario(Usuario usuario){

    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser){

      Navigator.pushReplacementNamed(context, "/home");

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
       */

    }).catchError((erro){
      print("Erro ${erro.toString()}");
      _mensagemErro = "Erro ao Logar.";
    });

  }

  Future _verificarUsuarioLogado() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    //auth.signOut();
    FirebaseUser usuarioLogado = await auth.currentUser();

    if(usuarioLogado != null){

      Navigator.pushReplacementNamed(context, "/home");

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );

       */
    }

  }

  @override
  void initState() {
    super.initState();
    _verificarUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(color: Color(0xff075e54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imagens/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style:  TextStyle(
                      fontSize: 20
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                      )
                    ),
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  keyboardType: TextInputType.text,
                  style:  TextStyle(
                      fontSize: 20
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    child: Text(""
                      "Entrar",
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
                      _validarCampos();
                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? cadastre-se!",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Cadastro()
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
