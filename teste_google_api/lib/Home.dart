import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Completer<GoogleMapController> _controller = Completer();

  _onMapCreated( GoogleMapController googleMapController){
    _controller.complete( googleMapController );
    //_controller.future;
  }

  _googleMapsApi() async {

    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(-25.423610, -49.270376),
                zoom: 16,
                tilt: 0, // angulo da camera ex: 45
                bearing: 0 // rotação da camera ex: 30
            )
        )
    );

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Teste google-maps-flutter"),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          //mapType: MapType.none,
          //mapType: MapType.satellite,
          //mapType: MapType.terrain,
          //mapType: MapType.hybrid,
          //-25.443213, -49.061693
          initialCameraPosition: CameraPosition(
              target: LatLng(-25.425081, -49.265968),
              zoom: 16
          ),
          onMapCreated: _onMapCreated,
          /*
          onMapCreated: (GoogleMapController controller){
            _controller.complete( controller );
          },
          */

          // criar marcadores no mapa
          //markers: _marcadores,

          // criando formas
          //polygons: _polygons,

          // criando linhas
          //polylines: _polylines,

        ),
      ),
    );
  }
}
