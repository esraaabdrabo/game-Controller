import 'package:esraaabdrabo/animation/gradient.dart';
import 'package:esraaabdrabo/animation/offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'animation/examples/1/1.dart';
import 'painter/painter.dart';

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
            backgroundColor: Colors.black,
            body: Sizer(
                builder: (context, orientation, deviceType) => Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        AnimateOffset(
                          begin: const Offset(0, .25),
                          end: const Offset(0, -.25),
                          isRepeat: true,
                          duration: const Duration(milliseconds: 2000),
                          widget: AnimateGradient(
                            height: 35.h,
                            width: 20.w,
                            colors: const [Colors.green, Colors.white],
                            begin: -50,
                            end: 260,
                            duration: const Duration(seconds: 30),
                            isForward: true,
                            widget: Text(
                              '🍔🍔🍔🍔',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.arbutusSlab(fontSize: 15.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        AnimateGradient(
                            height: 35.h,
                            width: 20.w,
                            colors: const [Colors.red, Colors.yellow],
                            isForward: true,
                            curve: Curves.bounceInOut,
                            begin: 0,
                            end: 360,
                            widget: const SizedBox(),
                            duration: const Duration(seconds: 50)),
                        SizedBox(
                          width: 2.w,
                        ),
                        AnimateGradient(
                            height: 35.h,
                            width: 20.w,
                            colors: const [
                              Colors.red,
                              Colors.black,
                              Colors.black,
                              Colors.black
                            ],
                            isForward: true,
                            curve: Curves.ease,
                            begin: 0,
                            end: 360,
                            widget: Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 20.w,
                                color: Color.fromARGB(255, 184, 181, 185),
                                child: Text(
                                  "Hello  🐣",
                                  textAlign: TextAlign.center,
                                  style:
                                      GoogleFonts.arbutusSlab(fontSize: 15.sp),
                                )),
                            duration: const Duration(seconds: 100)),
                        SizedBox(
                          width: 2.w,
                        ),
                        AnimateGradient(
                            height: 35.h,
                            width: 20.w,
                            colors: const [Colors.blue, Colors.white],
                            isForward: true,
                            curve: Curves.fastLinearToSlowEaseIn,
                            begin: 0,
                            end: 360,
                            widget: Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 20.w,
                                child: Text(
                                  "☕☕🖥️",
                                  textAlign: TextAlign.center,
                                  style:
                                      GoogleFonts.arbutusSlab(fontSize: 15.sp),
                                )),
                            duration: const Duration(seconds: 200)),
                        SizedBox(
                          width: 2.w,
                        ),
                      ],
                    )))));
  }
}
