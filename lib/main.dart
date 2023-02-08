import 'package:esraaabdrabo/animation/text.dart';
import 'package:flutter/material.dart';
import 'animation/size.dart';

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
        home: AnimateText(
          begin: -1,
          end: 1,
          widget: const Text("ESRAA ABDRABO"),
          duration: const Duration(seconds: 30),
          isForward: true,
        ) //const PlayController()
        );
  }
}
