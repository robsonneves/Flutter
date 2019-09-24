import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double _valor = 5;
  String _label = 'Valor Selecionado';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrada de Dados"),
        ),
        body: Container(
          padding: EdgeInsets.all(60),
          child: Column (
            children: <Widget>[

              Slider(
                  value: _valor,
                  min: 0,
                  max: 10,
                  label: _label,
                  divisions: 5,
                  activeColor: Colors.red,
                  inactiveColor: Colors.black54,
                  onChanged: (double novoValor){
                    setState(() {
                      _valor = novoValor;
                      _label = novoValor.toString();
                    });
                    print(novoValor.toString());
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
                  print(_valor.toString());
                },
              )

            ],
          ),
        )
    );
  }
}
