
import 'package:flutter/material.dart';
import 'package:my_project/models/transferencia.dart';

import 'formulario_transferencia.dart';

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }

}

class ListaTransferenciasState extends State<ListaTransferencia>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
      ),

      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia =  widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),

      /*
      body: ListView(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 10000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
        ],
      ),*/

      /*
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 10000)),
          ItemTransferencia(Transferencia(200.0, 11000)),
          ItemTransferencia(Transferencia(300.0, 12000)),
        ],
      ),*/

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
          return FormularioTransferencia();
        }));
        future.then((transferenciaRecebida){
          Future.delayed(Duration(seconds: 1), (){
            debugPrint('Dentro do Fiture !');
            debugPrint('$transferenciaRecebida');
            if(transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        });
      },
      ),
    );
  }

}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}