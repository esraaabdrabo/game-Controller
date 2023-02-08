import 'package:flutter/material.dart';
import 'animation/animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game Controller',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimationExample() //const PlayController()
        );
  }
}
