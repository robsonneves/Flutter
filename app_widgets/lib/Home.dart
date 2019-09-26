import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ['João', 'Pedro', 'Marcos'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _lista.length,
                itemBuilder: (context, index){

                  final item = _lista[index];
                  return Dismissible(
                      background: Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.edit, color: Colors.white,)
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.delete, color: Colors.white,),
                          ],
                        ),
                      ),
                      //direction: DismissDirection.horizontal,
                      //direction: DismissDirection.vertical,
                      //direction: DismissDirection.up,
                      //direction: DismissDirection.endToStart,
                      onDismissed: (direction){
                        print(direction.toString());

                        if( direction == DismissDirection.endToStart ){
                          print(" endToStart");
                        }else if( direction == DismissDirection.startToEnd ){
                          print(" endToEnd");
                        }

                        setState(() {
                          _lista.removeAt(index);
                        });

                      },
                      key: Key( item ),
                      child: ListTile(
                        title: Text( item ),
                      )
                  );

                }
            ),
          )
        ],
      ),
    );
  }
}
