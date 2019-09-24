import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;
  //bool _escolhaConfig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrada de Dados"),
        ),
        body: Container(
          child: Column (
            children: <Widget>[

              SwitchListTile(
                  title: Text('Receber Notificações !'),
                  value: _escolhaUsuario,
                  onChanged: (bool valor){
                    setState(() {
                      _escolhaUsuario = valor;
                    });
                  }
              ),
              RaisedButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                onPressed: (){

                  if(_escolhaUsuario){
                    print("escolha: ativar notificações");
                  }else{
                    print("escolha: Não ativar notificações");
                  }


                  //print("Resultado " + _escolhaUsuario.toString());
                },
              )

              /*
              SwitchListTile(
                  title: Text('Receber Configuração !'),
                  value: _escolhaConfig,
                  onChanged: (bool valor){
                    setState(() {
                      _escolhaConfig = valor;
                    });
                  }
              ),
              */

              /*
              Switch(
                  value: _escolhaUsuario,
                  onChanged: (bool valor){
                    setState(() {
                      _escolhaUsuario = valor;
                    });
                  }
              ),
              Text('Receber Notificações !')
              */

            ],
          ),
        )
    );
  }
}
