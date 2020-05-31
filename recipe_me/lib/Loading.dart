import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'API.dart';

class Loading extends StatefulWidget{

  List urls;

  Loading(List url){
    this.urls = url;
  }
  
  State<StatefulWidget> createState() {
    return new _LoadingState(urls);
  }

  /*static void setUrl(String u) {
    url = u;
  }

  static String getUrl(){
    return url;
  }*/

}

class _LoadingState extends State<Loading>{

  List urls;

  _LoadingState(List url){
    this.urls = url;
  }


  //String myUrl = Loading.getUrl();

  //String s = await getData(myUrl);
  
  Widget build(BuildContext context){

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Loading Your Recipes')
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for(int i = 0; i < urls.length; i++)
              Linkify(
                onOpen: (link) async{
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
              text: "Made by " + urls[i],
              style: TextStyle(color: Colors.yellow),
              linkStyle: TextStyle(color: Colors.red),
              
              )
          ]
      ))));
      
  }
  
}