import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:kloverseries_app/views/home.dart';

class Splashscreen extends StatefulWidget {
  @override

  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen> {
  @override

  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new AfterSplashScreen(),
      title: new Text('KLOVERSERIES', 
        style: new TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500
        ),
      ),
      image: new Image.network('https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print('Flutter Egypt'),
      loaderColor: Colors.red,
    );
  }
}

class AfterSplashScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new HomeScreen();
  }
}