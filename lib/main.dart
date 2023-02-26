import 'package:esraaabdrabo/animation/height.dart';
import 'package:esraaabdrabo/animation/size.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

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
            //  backgroundColor: Colors.black,
            body: Sizer(
          builder: (context, orientation, deviceType) => AnimateHeight(
            begin: 0,
            end: 150,
            curve: Curves.bounceOut,
            width: double.infinity,
            widget: Container(color: Colors.red, height: 400, width: 400),
            duration: const Duration(seconds: 2),
            isForward: true,
          ),
        )));
  }
}
