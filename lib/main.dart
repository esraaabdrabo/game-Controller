import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'animation/examples/1/1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Esraa Abdrabo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Sizer(
                builder: (context, orientation, deviceType) => Material(
                    color: Color.fromARGB(255, 255, 202, 202),
                    child: EXAMPLE1()))));
  }
}
