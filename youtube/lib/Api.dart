import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBvsPxiTkXHajkWEccupMkrl4v95uc6KDc";
const ID_CANAL = "UCexZo0YmKfz7tuxcpHJmtJg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";


class Api {

  Future<List<Video>> pesquisar (String pesquisa) async {

    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            //"&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if( response.statusCode == 200){

      //print( response.body );
      //print("OK");

      //Map<String, dynamic> dadosJson = json.decode(response.body);

      //print("Resultado" + dadosJson["pageInfo"]["totalResults"] );
      //print("Resultado" + dadosJson["pageInfo"].toString() );
      //print("Resultado" + dadosJson["items"][0].toString() );
      //print("Resultado" + dadosJson["items"][0]["id"]["videoId"].toString() );
      //print("Resultado" + dadosJson["items"][0]["snippet"]["title"].toString() );
      //print("Resultado" + dadosJson["items"][1]["snippet"]["title"].toString() );
      //print("Resultado" + dadosJson["items"][2]["snippet"]["title"].toString() );

      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            //return Video.fromJson(map);
            //return Video.converterJson(map);
            return Video.fromJson(map);
          }
      ).toList();


      return videos;

      /*
      for( var video in videos){
        print("Resultado: " + video.titulo);
      }
       */

      /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString());
      }
      */

      print("Resultado" + dadosJson["items"].toString() );

    }else{
      print("Erro !!!");
    }
    
  }
}