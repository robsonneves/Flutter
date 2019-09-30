import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = VideoPlayerController.asset(
        "videos/exemplo.mp4"
    )..setLooping(true)
    ..initialize().then((_){
      setState(() {
        //_controller.play();
      });
      //_controller.play();
    });

    /*
    // Executando com uma URL
    _controller = VideoPlayerController.network(
      "digitar url"
    )..initialize().then((_){
      setState( (){
        _controller.play();
      });
    });

     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized 
            ? AspectRatio(
                //aspectRatio: 800 / 600,
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ) 
            : Text("Precione Play"),

        /*
        child: AspectRatio(
          //aspectRatio: 800 / 600,
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),

         */
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( _controller.value.isPlaying ? Icons.pause : Icons.play_arrow ),
        onPressed: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
      ),
    );
  }
}

