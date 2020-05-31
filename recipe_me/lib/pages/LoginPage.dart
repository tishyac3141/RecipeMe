import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_me/pages/RegisterPage.dart';
import 'package:recipe_me/pages/Preference.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  void validateLoginInput() async {
    if (_loginFormKey.currentState.validate()) {
      try{
      AuthResult result = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(email: emailInputController.text, password: pwdInputController.text);    
      Navigator.push(context, MaterialPageRoute(builder: (context) => Preference()));
      } 
      catch(error){
        switch(error.code){
          case "ERROR_USER_NOT_FOUND":
          {
             showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: Text("There is no user with such entries. Please try again."),
                        ),
                      );
                    });
          }
          break;
          case "ERROR_WRONG_PASSWORD":
          {
               showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: Text("Password does not match your email. Please try again."),
                        ),
                      );
                    });
          }
          break;
          default:
          {
             Navigator.push(context, MaterialPageRoute(builder: (context) => Preference()));
          }
        }
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login to get your recipes!"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              key: _loginFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email*', hintText: "john.doe@gmail.com"),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password*', hintText: "********"),
                    controller: pwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                    ),
                    onPressed: ()  {
                      validateLoginInput();
                    },
                  ),
                  Text("Don't have an account yet?"),
                  FlatButton(
                    child: Text("Register here!"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                  )
                ],
              ),
            ))));
  }
}

