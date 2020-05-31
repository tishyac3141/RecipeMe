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

class _PreferenceState extends State<Preferences> {
  
  final databaseReference = Firestore.instance;

  init(){
    _createRecord();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Dietary Preferences"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                  child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.prefs.map((Pref p) {
                  return new PrefItemList(p);
                }).toList(),
              )),
            ],
          ),
        ));

        
  }

  void _createRecord() async {
    DocumentReference ref = await databaseReference.collection("userpreferences")
                            .add(({
                              'Vegan': true,
                              'Vegetarian': false
                            }));
    print(ref.documentID);
  }
}
class PrefItemList extends StatefulWidget {
  final Pref preference;
  
  PrefItemList(Pref pref)
      : preference = pref,
        super(key: new ObjectKey(pref));
  
  PreferenceItemState createState() {
    return new PreferenceItemState(preference);
  }
}
class PreferenceItemState extends State<PrefItemList> {
  
  final Pref pref;
  
  PreferenceItemState(this.pref);
  
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Row(
      children: <Widget>[
        new Expanded(child: new Text(pref.name)),
        new Checkbox(
            value: pref.isCheck,
            onChanged: (bool value) {
              setState(() {
                pref.isCheck = value;
              });
            })
      ],
    ));
  }
}


class Pref{
  String name;
  bool isCheck;
  Pref(this.name, this.isCheck);

  bool getValue(){ return isCheck; }

}
