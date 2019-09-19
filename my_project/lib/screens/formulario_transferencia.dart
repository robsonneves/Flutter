import 'package:flutter/material.dart';
import 'package:my_project/components/editor.dart';
import 'package:my_project/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransfwrwnciaState();
  }

}

class FormularioTransfwrwnciaState extends State<FormularioTransferencia>{

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Criando Transferencia')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(controlador: _controladorCampoNumeroConta, rotulo:'Número da conta', dica: '0000'),
              Editor(controlador: _controladorCampoValor, rotulo:'Valor', dica:'0.00', icone:Icons.monetization_on),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
        ));
  }
  void _criarTransferencia(BuildContext context) {
    //print('Clicou no confirmar!');
    //debugPrint('Clicou');

    final int numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text);
    final double valor =
    double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      debugPrint('Criando Transferencia!');
      Navigator.pop(context, transferenciaCriada);
    }

    //debugPrint(_controladorCampoNumeroConta.text);
    //debugPrint(_controladorCampoValor.text);
  }

}
