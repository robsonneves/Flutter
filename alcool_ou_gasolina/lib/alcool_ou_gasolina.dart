import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = '';

  void _calcular(){

    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    
    if(precoAlcool == null || precoGasolina == null){
      print('Digite numeros maiores do que 0 e utilizando ponto.');
      setState(() {
        _textoResultado = 'Digite numeros maiores do que 0 e utilizando ponto.';
      });
    }else{
      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor Abastercer com GASOLINA !";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor Abastercer com ALCOOL !";
        });
      }

      //_limparCampos();

    }

  }

  void _limparCampos(){
    _controllerGasolina.text = '';
    _controllerAlcool.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcool ou Gasolina ?'),
      ),
      body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset('imagens/gasolina.jpg', width: 100,),
                ),
                Padding(
                  padding:EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Saiba qual a melhor opção para abastecimentodo seu carro.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Preço do Alcool. Ex: 1.96'
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Preço da Gasolina. Ex: 2.15'
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding:  EdgeInsets.all(15),
                    onPressed: _calcular,
                    child: Text('Calcular', style: TextStyle(fontSize: 20),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        )
    );
  }
}
