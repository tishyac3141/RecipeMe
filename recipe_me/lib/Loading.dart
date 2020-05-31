

import 'package:flutter/material.dart';

class Loading extends StatefulWidget{
  
  State<StatefulWidget> createState() {
    return new _LoadingState();
  }

}

class _LoadingState extends State<Loading>{
  
  Widget build(BuildContext context) {
    return Scaffold(appBar: new AppBar(title: new Text('Loading Your Recipes')));
  }
  
}