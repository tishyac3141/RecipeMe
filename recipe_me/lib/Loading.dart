

import 'package:flutter/material.dart';
import 'API.dart';

class Loading extends StatefulWidget{

  //static String url;
  
  State<StatefulWidget> createState() {
    return new _LoadingState();
  }

  /*static void setUrl(String u) {
    url = u;
  }

  static String getUrl(){
    return url;
  }*/

}

class _LoadingState extends State<Loading>{

  //String myUrl = Loading.getUrl();

  //String s = await getData(myUrl);
  
  Widget build(BuildContext context){

    return Scaffold(appBar: new AppBar(title: new Text('Loading Your Recipes')));
  }
  
}