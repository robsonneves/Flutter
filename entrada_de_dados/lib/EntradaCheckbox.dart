import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _valorCheckboxBrasileira = false;
  bool _valorCheckboxMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            CheckboxListTile(
              title: Text("Comida Brasileira."),
              subtitle: Text('Teste ...'),
              //activeColor: Colors.red,
              //selected: true,
              //secondary: Icon(Icons.fastfood),
              value: _valorCheckboxBrasileira,
              onChanged: (bool valor){
                setState(() {
                  _valorCheckboxBrasileira = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida Mexicana."),
              subtitle: Text('Teste ... teste'),
              //activeColor: Colors.red,
              //selected: true,
              //secondary: Icon(Icons.fastfood),
              value: _valorCheckboxMexicana,
              onChanged: (bool valor){
                setState(() {
                  _valorCheckboxMexicana = valor;
                });
              },
            ),
            RaisedButton(
              child:  Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              onPressed: (){
                print(
                    "Comida Brasileira " + _valorCheckboxBrasileira.toString() +
                    " Comida mexicana " + _valorCheckboxMexicana.toString()
                );
              },
            ),

            /*
            Text("Comida Brasileira :"),
            Checkbox(
                value: _valorCheckbox,
                onChanged: (bool valor){
                  setState(() {
                    _valorCheckbox = valor;
                  });
                  print("Checkbo " + valor.toString());
                },
            ),

             */

          ],
        ),
      )
    );
  }
}
