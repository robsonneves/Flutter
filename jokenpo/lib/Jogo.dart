import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
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
          Image.asset('imagens/padrao.png', height: 100,),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('imagens/pedra.png', width: 100,),
              Image.asset('imagens/papel.png', width: 100,),
              Image.asset('imagens/tesoura.png', width: 100,),
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
