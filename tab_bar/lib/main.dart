import 'package:flutter/material.dart';
import 'package:tab_bar/PrimeiraPg.dart';
import 'package:tab_bar/SegundaPg.dart';
import 'package:tab_bar/TerceiraPg.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this,
        //initialIndex: 0
        //initialIndex: 1
        //initialIndex: 2
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Primeira Pg",
              icon: Icon(Icons.home),
            )  ,
            Tab(
              text: "Segunda Pg",
              icon: Icon(Icons.email),
            )  ,
            Tab(
              text: "Terceira Pg",
              icon: Icon(Icons.account_circle),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PrimeiraPg(),
          SegundaPg(),
          TerceiraPg()
        ],
      ),
    );
  }
}
