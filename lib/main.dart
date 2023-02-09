import 'package:esraaabdrabo/animation/obacity.dart';
import 'package:esraaabdrabo/animation/shadow.dart';
import 'package:flutter/material.dart';

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
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: AnimateShadow(
              begin: const Offset(-10, -10),
              end: const Offset(10, -10),
              duration: const Duration(milliseconds: 5000),
            ),
          ),
        ));
  }
}
