
import 'package:animations/slide_transition2/home_page2.dart';
import 'package:animations/slide_transition2/home_page3.dart';
import 'package:flutter/material.dart';
import 'all_animation.dart';
import 'animated_icon.dart';
import 'animated_switcher.dart';
import 'fade_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:AnimatedIconPage(),
    );
  }
}

