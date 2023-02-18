import 'package:esraaabdrabo/animation/examples/1/fallingWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  bool start = false;

  @override
  Widget build(BuildContext context) {
    hello() {
      return InkWell(
          child: Text(
            "Hello Again , We Are More Than Happy To See You.",
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(fontSize: 10.sp, color: Colors.white),
          ),
          onTap: () {
            start = true;
            setState(() {});
          });
    }

    return start
        ? FallingWidget(milliSeconds: 2000, start: start, widget: hello())
        : hello();
  }
}
