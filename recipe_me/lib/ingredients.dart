import 'package:flutter/material.dart';
//import 'dart:async';

//import 'search.py';
class SearchList extends StatefulWidget {
  SearchList({Key key, this.product}) : super(key: key);
  final List<Product> product;
  @override
  _SearchState createState() {
    return new _SearchState();
  }
}
TextEditingController aController = new TextEditingController();
class _SearchState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("RecipeMe"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                  child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.product.map((Product product) {
                  return new SearchItemList(product);
                }).toList(),
              )),

               TextField(
  
  controller: aController,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'other',
  ),
),

              new RaisedButton(
                onPressed: () {
                  String myList = aController.text;
                  
                  for (Product p in widget.product) {
                    if (p.isCheck) {
                      myList= myList+","+(p.name.toString());
                      
                    }
                
                  }
                  
                  print(myList);
                  //searching(myList);
                },
                child: new Text('Next'),
                
              )
            ],
          ),
        ));
  }
}
class SearchItemList extends StatefulWidget {
  final Product product;
  SearchItemList(Product product)
      : product = product,
        super(key: new ObjectKey(product));
  @override
  SearchState createState() {
    return new SearchState(product);
  }
}
class SearchState extends State<SearchItemList> {
  final Product product;
  SearchState(this.product);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Row(
      children: <Widget>[
        new Expanded(child: new Text(product.name)),
        new Checkbox(
            value: product.isCheck,
            onChanged: (bool value) {
              setState(() {
                product.isCheck = value;
              });
            })
      ],
    ));
  }
}
void main() {
  
    runApp(new MaterialApp(
      title: 'ListView CheckBox',
      home: SearchList(product: [
        new Product('asparagus', false),
        new Product('apple', false),
        new Product('avocado', false),
        new Product('alfalfa', false),
        new Product('almond', false),
        new Product('arugala', false),
        new Product('artichoke', false),
        new Product('bacon', false),
        new Product('black beans', false),
        new Product('bagels', false),
        new Product('baked beans', false),
        new Product('barley', false),
        new Product('banana', false),
        new Product('beer', false),
        new Product('beef', false),
        new Product('beet', false),
        new Product('bread', false),
        new Product('bell pepper', false),
        new Product('broccoli', false),
        new Product('butter', false),
        new Product('cabbage', false),
        new Product('carrot', false),
        new Product('celery', false),
        new Product('cheese', false),
        new Product('chicken', false),
        new Product('catfish', false),
        new Product('chips', false),
        new Product('chocolate', false),
        new Product('clams', false),
        new Product('coffee', false),
        new Product('cookies', false),
        new Product('corn', false),
        new Product('crab', false),
        new Product('curry', false),
        new Product('cereal', false),
        new Product('cherry', false),
        new Product('dates', false),
        new Product('dough', false),
        new Product('duck', false),
        new Product('eggs', false),
        new Product('edimame', false),
        new Product('eel', false),
        new Product('fish', false),
        new Product('flour', false),
        new Product('garlic', false),
        new Product('ginger', false),
        new Product('goose', false),
        new Product('granola', false),
        new Product('grapes', false),
        new Product('green beans', false),
        new Product('guacamole', false),
        new Product('graham crackers', false),
        new Product('ham', false),
        new Product('honey', false),
        new Product('hummus', false),
        new Product('ice cream', false),
        new Product('jelly', false),
        new Product('jam', false),
        new Product('jerky', false),
        new Product('jalapeno', false),
        new Product('kale', false),
        new Product('ketchup', false),
        new Product('kiwi', false),
        new Product('kidney beans', false),
        new Product('lobster', false),
        new Product('lamb', false),
        new Product('linguine', false),
        new Product('mango', false),
        new Product('meatballs', false),
        new Product('milk', false),
        new Product('mushroom', false),
        new Product('noodles', false),
        new Product('nectarine', false),
        new Product('oatmeal', false),
        new Product('olive', false),
        new Product('olive oil', false),
        new Product('onion', false),
        new Product('pepperoni', false),
        new Product('pears', false),
        new Product('pancakes', false),
        new Product('pork', false),
        new Product('pineapple', false),
        new Product('raspberry', false),
        new Product('salmon', false),
        new Product('salt', false),
        new Product('spinach', false),
        new Product('sugar', false),
        new Product('spaghetti', false),
        new Product('strawberry', false),
        new Product('sweet potato', false),
        new Product('tater tots', false),
        new Product('toast', false),
        new Product('tortilla', false),
        new Product('udon', false),
        new Product('ube', false),
        new Product('vanilla', false),
        new Product('wine', false),
        new Product('walnuts', false),
        new Product('yogurt', false),
        new Product('zucchini', false),
       
    ]),
  ));
}
class Product {
  String name;
  bool isCheck;
  Product(this.name, this.isCheck);
}