import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double _volume = 0.1;

  _executar() async {

    audioPlayer.setVolume(_volume);
    if(primeiraExecucao) {
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }
    //String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    //int resultado = await audioPlayer.play(url);

  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
    if( resultado == 1){
      //sucesso
    }
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if( resultado == 1){
      //sucesso
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Executando sons"),
      ),
      body: Column(
        children: <Widget>[

          Slider(
              value: _volume,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (novoVolume){
                setState(() {
                  _volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              }
          ),

          Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             Padding(
               padding: EdgeInsets.all(8),
               child: GestureDetector(
                 child: Image.asset("assets/imagens/executar.png"),
                 onTap: (){
                  _executar();
                 },
               ),
             ),
             Padding(
               padding: EdgeInsets.all(8),
               child: GestureDetector(
                 child: Image.asset("assets/imagens/pausar.png"),
                 onTap: (){
                   _pausar();
                 },
               ),
             ),
             Padding(
               padding: EdgeInsets.all(8),
               child: GestureDetector(
                 child: Image.asset("assets/imagens/parar.png"),
                 onTap: (){
                   _parar();
                 },
               ),
             )

           ],
          )
        ],
      ),
    );
  }
}

