import 'package:flutter/material.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'signuppage.dart';
import 'screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: OnboardingScreen(),
     routes: <String, WidgetBuilder>{
       '/landingpage':(BuildContext context)=> new MyApp(),
       '/signup' : (BuildContext context)=> new SignupPage(),
       '/homepage' : (BuildContext context)=> new HomePage(),
       '/loginpage' : (BuildContext context)=> new LoginPage(),
     }
    );
  }
}
