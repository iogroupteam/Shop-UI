import 'package:flutter/material.dart';
import 'package:shoes_store/View/BottomNavigationBar/navBar.dart';

import 'View/Home/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(),
      theme: ThemeData(fontFamily: 'Questrial'),
    );
  }
}

List my_list = ["adventures", "caves", "nature", "oceans"];
