import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';
import 'package:whatsapp/Configutacoes.dart';
import 'package:whatsapp/Home.dart';
import 'package:whatsapp/Login.dart';
import 'package:whatsapp/Mensagens.dart';
import 'package:whatsapp/model/Usuario.dart';

class RouteGenaration {

  //static const String ROTA_HOME = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch( settings.name ){
      case "/": return MaterialPageRoute( builder:(_)=>Login() );
      case "/login": return MaterialPageRoute( builder:(_)=>Login() );
      case "/cadastro": return MaterialPageRoute( builder:(_)=>Cadastro() );
      case "/home": return MaterialPageRoute( builder:(_)=>Home() );
      case "/configuracoes": return MaterialPageRoute( builder:(_)=>Configuracoes() );
      case "/mensagens": return MaterialPageRoute( builder:(_)=>Mensagens(args) );

      //case ROTA_HOME: return MaterialPageRoute( builder:(_)=>Home() );

      default:
        _erroRota();
    }

  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text("Tela não encontrada !"),
          ),
          body: Center(
            child: Text("Tela não encontrada !"),
          ),
        );
      }
    );
  }

}