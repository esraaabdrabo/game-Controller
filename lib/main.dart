import 'package:esraaabdrabo/animation/obacity.dart';
import 'package:esraaabdrabo/animation/offset.dart';
import 'package:esraaabdrabo/animation/shadow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            backgroundColor: Colors.white,
            body: Sizer(
                builder: (context, orientation, deviceType) => Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          AnimateShadowExample(
                            begin: const Offset(-10, -10),
                            end: const Offset(10, -10),
                            duration: const Duration(milliseconds: 2500),
                          ),
                          const AnimateObacityExample(),
                        ],
                      ),
                    ))));
  }
}
