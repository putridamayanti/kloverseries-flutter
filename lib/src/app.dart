import 'package:flutter/material.dart';
import 'package:kloverseries_app/src/ui/home.dart';
import 'package:kloverseries_app/src/ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}