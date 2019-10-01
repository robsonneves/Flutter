import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future _recuperarImagem(bool daCamera) async {

    if( daCamera ){
  //    ImagePicker.pickImage(source: ImageSource.camera);
    }else{
    //  ImagePicker.pickImage(source: ImageSource.gallery);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar Imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Camera"),
              onPressed: (){
                _recuperarImagem(true);
              }
            ),
            RaisedButton(
                child: Text("Galeria"),
                onPressed: (){
                  _recuperarImagem(false);
                }
            )
          ],
        ),
      ),
    );
  }
}

