import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_me/main.dart';

class Preferences extends StatefulWidget{
 
   Preferences({Key key, this.prefs}) : super(key: key); 
  //update the constructor to include the uid
  final List<Pref> prefs;

  State<StatefulWidget> createState() {
    return new _PreferenceState();
  } 
  
}

class _PreferenceState extends State<Preferences>{
  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Dietary Restrictions: ")
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Pref('Vegan', false)
        ])
      ));
  }
  
}

class Pref extends Widget{
  String name;
  bool isCheck;
  
  Pref(title, isChecked){
    name = title;
    isCheck = isChecked;

  }

  Widget create(){
    return CheckboxListTile(title: new Text(name), onChanged:(bool value){onChanged(value);});
  }

  void onChanged(bool value){
    isCheck = value;
  }

  bool getValue(){ return isCheck; }

  @override
  Element createElement() {
    create();
  }

}