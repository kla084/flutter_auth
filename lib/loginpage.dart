import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  GoogleSignIn googleAuth = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFFFFD700),
                  Color(0xFFFF8C00),
                ],
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('FacialDorm',
                style: TextStyle(fontSize: 30),),
              SizedBox(height: 50.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value){
                  setState(() {
                    _email=value;
                  });
                },
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password'),
                onChanged: (value){
                  setState(() {
                    _password=value;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: _email,
                    password: _password,)
                      .then((AuthResult auth){})
                      .then((FirebaseUser user) {
                        Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                     print(e);
                   });
                },
              ),
              SizedBox(height: 15.0,),
              Text('Don\'t have an account?' ),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  Navigator.of(context).pushNamed('/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}