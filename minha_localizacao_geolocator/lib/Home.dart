import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _iniciarLocator() async {


    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print("############# " + position.toString() );

  }

  @override
  void initState() {
    super.initState();
    _iniciarLocator();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Geolocator - Minha Localização."),
      ),
      body: Container(),
    );
  }
}
