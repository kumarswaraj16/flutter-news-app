import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blueGrey[900],
      scaffoldBackgroundColor: Colors.black,
    ),
    home: HomePage(),
  ),);
}