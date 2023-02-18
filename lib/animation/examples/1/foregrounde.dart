import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../click_me_widget.dart';
import 'fallingWidget.dart';
import 'hello_widget.dart';
import 'logo.dart';

class ForeGround extends StatefulWidget {
  const ForeGround({super.key});

  @override
  State<ForeGround> createState() => _ForeGroundState();
}

class _ForeGroundState extends State<ForeGround> {
  body() {
    return InkWell(
      onTap: () {
        start = true;
        setState(() {});
      },
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.w),
            gradient:
                const LinearGradient(colors: [Colors.cyan, Colors.black])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Logo(), Hello(), ClickMeBTN()],
        ),
      ),
    );
  }

  bool start = false;
  @override
  Widget build(BuildContext context) {
    return start
        ? FallingWidget(milliSeconds: 3000, start: start, widget: body())
        : body();
  }
}
