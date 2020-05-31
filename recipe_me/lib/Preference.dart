import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_me/Loading.dart';
import 'package:recipe_me/main.dart';

class Preference extends StatefulWidget{
 
   Preference({Key key, this.prefs}) : super(key: key); 
  //update the constructor to include the uid
  final List<Pref> prefs;

  State<StatefulWidget> createState() {
    return new _PreferenceState();
  } 
  
}

class _PreferenceState extends State<Preference>{
  
  final databaseReference = Firestore.instance;
  
  List<Pref> list = [
    new Pref('Vegan', false),
    new Pref('Vegetarian', false),
    new Pref('Nuts Allergy', false),
    new Pref('Gluten Allergy', false),
    new Pref('Wheat Allergy', false),
    new Pref('Shellfish Allergy', false),
    new Pref('Soy Allergy', false),
    new Pref('Peanut Allergy', false),
    new Pref('Egg Allergy', false),
    new Pref('Fruit Allergy', false),
    new Pref('No Dairy', false),
    new Pref('No Garlic', false),
    new Pref('No Onions', false)
  ];

  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Choose your Restrictions: ")
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CheckboxListTile(title: new Text('Vegan'), value: list[0].isCheck, onChanged:(bool value){
                                  setState(() {
                                    list[0].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Vegetarian'), value: list[1].isCheck, onChanged:(bool value){
                                  setState(() { 
                                    list[1].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Nuts Allergy'), value: list[2].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[2].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Gluten Allergy'), value: list[3].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[3].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Wheat Allergy'), value: list[4].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[4].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Shellfish Allergy'), value: list[5].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[5].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Soy Allergy'), value: list[6].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[6].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Peanut Allergy'), value: list[7].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[7].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Egg Allergy'), value: list[8].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[8].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('Fruit Allergy'), value: list[9].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[9].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('No Dairy'), value: list[10].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[10].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('No Garlic'), value: list[11].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[11].isCheck = value;
                                  });}),
            CheckboxListTile(title: new Text('No Onions'), value: list[12].isCheck, onChanged:(bool value){
                                  setState(() {
                                      list[12].isCheck = value;
                                  });}),
        
            new RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loading()));
                },
                child: new Text('Next'),
              )
        ],
        
        )) 
      )); 

      
  }

  void _createRecord() async {
    for(int i = 0; i < list.length; i++){
      DocumentReference ref = await databaseReference.collection("userpreferences")
                          .add({
                            list[i].getTitle() : list[i].getIsChecked()
                          });
    }
    
    
  }
  
}

class Pref{
  String name;
  bool isCheck;
  
  Pref(this.name, this.isCheck);

  bool getIsChecked(){return isCheck;}
  String getTitle(){return name; }

}