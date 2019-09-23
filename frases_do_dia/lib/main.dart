import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,

    debugShowCheckedModeBanner: false,
    home: HomeStatefull() //Home()

    //title: 'Frases do dia',

    //home: Container(color: Colors.white,),
    //home: Column(children: <Widget>[]
    //home: Row(children: <Widget>[]
    /*
    home: Row(children: <Widget>[
      Text(
          't1 : t1 : t1 :t1 :t1 : t1 : t1 : t1 : t1 : '
          't1 : t1 : t1 : t1 : t1 : t1 : t1 : t1 :t1 : t1 :',
          style: TextStyle(
            fontSize: 25
          ),
      ),

    ],),
     */

    /*
    home: Container(

      //color: Colors.white,
      //padding: EdgeInsets.all(30),
      //padding: EdgeInsets.fromLTRB(0,70,0,0), // esquerda, cima, direita, baixo

        margin: EdgeInsets.only(top: 40),
        // esquerda, cima, direita, baixo

        //margin: EdgeInsets.all(30),
        //margin: EdgeInsets.fromLTRB(0,0,0,0), // esquerda, cima, direita, baixo
        //margin: EdgeInsets.only(top: 0, left: 0),

        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.white)
        ),

        //child: Row(children: <Widget>[], ,mainAxisAlignment: ,)

        //child: Row(children: <Widget>[

        child: Image.asset(
          'img/mobile-phone.jpg',

          //fit: BoxFit.contain,
          //fit: BoxFit.cover,
          //fit: BoxFit.fill,
          //fit: BoxFit.fitHeight,
          //fit: BoxFit.fitWidth,
          //fit: BoxFit.none,
          fit: BoxFit.scaleDown,

        ),*/

        /*
        child: Column(children: <Widget>[
            Text('t1'),
            Text('t2'),
            Text('t3'),
          ],
          //,mainAxisAlignment: MainAxisAlignment.start
          //,mainAxisAlignment: MainAxisAlignment.center
          //,mainAxisAlignment: MainAxisAlignment.end
          //,mainAxisAlignment: MainAxisAlignment.spaceEvenly
          //,mainAxisAlignment: MainAxisAlignment.spaceAround
          //,mainAxisAlignment: MainAxisAlignment.spaceBetween
          ,mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          //crossAxisAlignment: CrossAxisAlignment.stretch,

        ,)*/


      /*
      child: Column(
        children: <Widget>[

          Text("t1"),
          Text("t2"),
          Text("t3")


            /*
            Text("t1"),
            Padding(
                padding: EdgeInsets.all(30),
                child: Text('T2'),
            ),
            Text("t3"),
            Text(
              'Texto Texto Texto Texto Texto Texto Texto Texto',
              textAlign: TextAlign.justify,
            )
            */


          /*
          FlatButton(
              onPressed: (){
                print("Btn ok ....");
              },
              child: Text(
                "Clique Aqui",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none
                ),
              ))

          */
          /*
          Text(
              'Texto um Texto',
              style: TextStyle(
                fontSize: 35,
                //fontStyle: FontStyle.italic,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                //fontWeight: FontWeight.bold,
                //fontWeight: FontWeight.w100,
                //fontWeight: FontWeight.w900,
                //letterSpacing: 10,
                letterSpacing: 0,
                //wordSpacing: 10,
                wordSpacing: 0,
                //decoration: TextDecoration.none,
                //decoration: TextDecoration.lineThrough,
                //decoration: TextDecoration.lineThrough,
                decorationColor: Colors.greenAccent,
                //decoration: TextDecoration.overline,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                //decorationStyle: TextDecorationStyle.dashed,
                //decorationStyle: TextDecorationStyle.dotted,
                //decorationStyle: TextDecorationStyle.double,
                //decorationStyle: TextDecorationStyle.wavy,
                color:  Colors.black
              ),
          ), */
        ],*/
    ),
  );
}

class HomeStatefull extends StatefulWidget {
  @override
  _HomeStatefullState createState() => _HomeStatefullState();
}

class _HomeStatefullState extends State<HomeStatefull> {

  var _texto = "Instagram";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_texto), //Text('Instagram'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState(() {
                  _texto = "Curso Flutter!";
                });
              },
              child: Text('Click Aqui!'),
            ),
            Text('Nome: $_texto ')
          ],
        ),
      ),
    );

  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var _titulo = "Instagram";

    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo), //Text('Instagram'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: Text('Conteudo principal.'),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen,
          child:  Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text('T1'),
                Text('T2'),
              ],
            ),
          )
      ),
    );
  }
}
