
import 'package:flutter/material.dart';
import 'package:news_app/Homepage.dart';
import 'package:splashscreen/splashscreen.dart';

main() {
  runApp(MaterialApp
  (
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new Homepage(),
        image: Image(
          image: AssetImage("assets/news4.png"),
        ),
        title: new Text(
          ' WELCOME TO TOP LETEST NEWS',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
