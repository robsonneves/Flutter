import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage('imagens/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case 'pedra' :
        setState(() {
          _imagemApp = AssetImage('imagens/pedra.png');
        });
        break;
      case 'papel' :
        setState(() {
          _imagemApp = AssetImage('imagens/papel.png');
        });
        break;
      case 'tesoura' :
        setState(() {
          this._imagemApp = AssetImage('imagens/tesoura.png');
        });
        break;
    }

    if((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
       (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
       (escolhaUsuario == 'papel' && escolhaApp == 'pedra')){
      setState(() {
        this._mensagem = 'Vc Ganhou';
      });
    }else if((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
             (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
             (escolhaApp == 'papel' && escolhaUsuario == 'pedra')){
      setState(() {
        this._mensagem = 'Vc Perdeu';
      });
    }else{
      setState(() {
        this._mensagem = 'Empatamos !';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:  32, bottom:  16),
            child: Text(
              'Escolha do APP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //Image.asset('imagens/padrao.png', height: 100,),

          Image(image: this._imagemApp, width: 100,),

          /*
          GestureDetector(
            onTap: (){ print('imagem cliacada !'); },
            onDoubleTap: (){ print('imagem double cliacada !'); },
            onLongPress: (){ print('imagem longgg cliacada !'); },
            child: ,
          ),
          */

          Padding(
            padding: EdgeInsets.only(top:  32, bottom:  16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('imagens/pedra.png', width: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('imagens/papel.png', width: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('imagens/tesoura.png', width: 100,),
              ),

              /*
              Image.asset('imagens/pedra.png', width: 100,),
              Image.asset('imagens/papel.png', width: 100,),
              Image.asset('imagens/tesoura.png', width: 100,),
              */

            ],
          )

          //text
          //img
          //text
          // imags 3

        ],
      ),
    );
  }
}
