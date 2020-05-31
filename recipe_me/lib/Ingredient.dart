import 'package:flutter/material.dart';
import 'Loading.dart';
import 'package:http/http.dart' as http;
import'API.dart';
import 'dart:convert';
import 'LoadingSymbol.dart';

class Ingredient extends StatefulWidget{
  
  State<StatefulWidget> createState() {
    return new _IngredientState();
  }
  
}

class _IngredientState extends State<Ingredient>{

  bool loading = false;
  
  List<Product> basicIngredients = [
    new Product('sugar', false),
    new Product('olive oil', false),
    new Product('sesame oil', false),
    new Product('salt', false),
    new Product('ketchup', false),
  ];

  List<Product> fruits = [
    new Product('apple', false),
    new Product('banana', false),
    new Product('strawberry', false),
    new Product('grapes', false),
    new Product('pears', false),
    new Product('cherries', false),
    new Product('dates', false),
    new Product('pineapple', false),
    new Product('mango', false),
    new Product('raspberry', false),
    new Product('kiwi', false),
  ];

  List<Product> vegetables = [
    new Product('asparagus', false),
    new Product('avocado', false),
    new Product('alfalfa', false),
    new Product('arugla', false),
    new Product('artichoke', false),
    new Product('beets', false),
    new Product('bell pepper', false),
    new Product('broccoli', false),
    new Product('cabbage', false),
    new Product('carrot', false),
    new Product('celery', false),
    new Product('corn', false),
    new Product('edamame', false),
    new Product('garlic', false),
    new Product('ginger', false),
    new Product('green beans', false),
    new Product('jalapeno', false),
    new Product('kale', false),
    new Product('mushroom', false),
    new Product('olive', false),
    new Product('onion', false),
    new Product('spinach', false),
    new Product('sweet potato', false),
    new Product('purple yam', false),
    new Product('zucchini', false)  
  ];

  List<Product> proteins = [
    new Product('black beans', false),
    new Product('tofu', false),
    new Product('clams', false),
    new Product('beef', false),
    new Product('bacon', false),
    new Product('pepperoni', false),
    new Product('meatballs', false),
    new Product('lobster', false),
    new Product('lamb', false),
    new Product('chicken', false),
    new Product('crab', false),
    new Product('eel', false),
    new Product('duck', false),
    new Product('fish', false),
    new Product('catfish', false),
    new Product('pork', false),
    new Product('jerky', false),
    new Product('ham', false),
    new Product('goose', false),
    new Product('salmon', false),
  ];  

  List<Product> dairy = [
    new Product('butter', false),
    new Product('eggs', false),
    new Product('cheese', false),
    new Product('milk', false),
    new Product('yogurt', false),
  ];

  List<Product> grains = [
    new Product('bread', false),
    new Product('spaghetti', false),
    new Product('linguine', false),
    new Product('noodles', false),
    new Product('bagels', false),
    new Product('barley', false),
  ];

  List<Product> baking = [
    new Product('vanilla', false),
    new Product('powdered sugar', false),
    new Product('flour', false),
    new Product('dough', false),
    new Product('graham crackers', false),
    new Product('chocolate', false),
    new Product('baking soda', false),
    new Product('walnuts', false),
    new Product('almond', false),
    new Product('pistachios', false),
    new Product('cookies', false),
  ];

  List<Product> ethnic = [
    new Product('udon', false),
    new Product('tortilla', false),
    new Product('kidney beans', false),
    new Product('hummus', false),
    new Product('guacamole', false),
    new Product('soy sauce', false),
    new Product('paneer', false),
  ];

  List<Product> misc = [
    new Product('wine', false),
    new Product('coffee', false),
    new Product('pancakes', false),
    new Product('beer', false),
    new Product('jelly', false),
    new Product('jam', false),
    new Product('ice cream', false),
  ];

  TextEditingController aController;
  
  initState(){
    aController = new TextEditingController();
  }

  Widget build(BuildContext context) {
    return loading ? LoadingSymbol() : Scaffold(
        appBar: new AppBar(
          title: new Text("Select Your Ingredients"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(5.0),
           child: SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text( "Basic Ingredients"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < basicIngredients.length; i++) 
                CheckboxListTile(
                  title: new Text(basicIngredients[i].getName()),
                  value: basicIngredients[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    basicIngredients[i].isCheck = value;
                  });
                  }),

              Text("Vegetables"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < vegetables.length; i++) 
                CheckboxListTile(
                  title: new Text(vegetables[i].getName()),
                  value: vegetables[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    vegetables[i].isCheck = value;
                  });
                  }),   

              Text("Fruits"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < fruits.length; i++) 
                CheckboxListTile(
                  title: new Text(fruits[i].getName()),
                  value: fruits[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    fruits[i].isCheck = value;
                  });
                  }),

              Text("Proteins"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < proteins.length; i++) 
                CheckboxListTile(
                  title: new Text(proteins[i].getName()),
                  value: proteins[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    proteins[i].isCheck = value;
                  });
                  }),
              
              Text("Dairy"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < dairy.length; i++) 
                CheckboxListTile(
                  title: new Text(dairy[i].getName()),
                  value: dairy[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    dairy[i].isCheck = value;
                  });
                  }),

              Text("Grains"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < grains.length; i++) 
                CheckboxListTile(
                  title: new Text(grains[i].getName()),
                  value: grains[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    grains[i].isCheck = value;
                  });
                  }),

              Text("Baking"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < baking.length; i++) 
                CheckboxListTile(
                  title: new Text(baking[i].getName()),
                  value: baking[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    baking[i].isCheck = value;
                  });
                  }),

              Text("Ethnic"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < ethnic.length; i++) 
                CheckboxListTile(
                  title: new Text(ethnic[i].getName()),
                  value: ethnic[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    ethnic[i].isCheck = value;
                  });
                  }),
              Text("Miscellanous"),
              Divider(
                color: Colors.black,
                height: 10,
                thickness: 3,
                indent: 20,
                endIndent: 0),
              for(int i = 0; i < misc.length; i++) 
                CheckboxListTile(
                  title: new Text(misc[i].getName()),
                  value: misc[i].getIsChecked(),
                  onChanged: (bool value) {
                  setState(() {
                    misc[i].isCheck = value;
                  });
                  }),

              TextField(
              controller: aController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'other',
              ),
            ),
            new RaisedButton(
                onPressed: () async {
                  setState(() => loading = true);
                  String myList = aController.text;
                  
                  for (Product p in basicIngredients) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in vegetables) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in fruits) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in proteins) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in baking) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in dairy) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in ethnic) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  for (Product p in grains) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                for (Product p in misc) {
                    if (p.isCheck) {
                      myList = myList + "," + (p.name.toString().trim());
                    }
                  }

                  myList = myList.substring(1);

                  String myUrl = "http://10.0.2.2:5000/api?Query=" + myList;
                  //List<String> lst = List<String>();
                  //Loading.setUrl(myUrl);
                  //print(await getData(myUrl));
                  List receivedUrls = jsonDecode(await getData(myUrl));
                  print(receivedUrls);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loading(receivedUrls)));
                },
                child: new Text('Next'),
                
              )
            ],
          ),
        )));
  }

}

class Product {
  String name;
  bool isCheck;
  Product(this.name, this.isCheck);

  String getName(){return name;}
  bool getIsChecked(){return isCheck;}
}