import 'package:flutter/material.dart';
import 'search.py';
class SearchList extends StatefulWidget {
  SearchList({Key key, this.product}) : super(key: key);
  final List<Product> product;
  @override
  _SearchState createState() {
    return new _SearchState();
  }
}
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
              new RaisedButton(
                onPressed: () {
                  List<String> myList = List<String>();
                  for (Product p in widget.product) {
                    if (p.isCheck) {
                      myList.add(p.name.toString());
                      
                    }
                
                  }
                  //return(myList);
                  searching(myList);
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
      new Product('Lettuce', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Eggs', false),
      new Product('Flour', false),
      new Product('Chocolate chips', false),
      new Product('Lettuce', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      new Product('Tomato', false),
      
    ]),
  ));
}
class Product {
  String name;
  bool isCheck;
  Product(this.name, this.isCheck);
}