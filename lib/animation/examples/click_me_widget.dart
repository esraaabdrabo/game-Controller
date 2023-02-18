import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '1/fallingWidget.dart';

class ClickMeBTN extends StatefulWidget {
  const ClickMeBTN({super.key});

  @override
  State<ClickMeBTN> createState() => _ClickMeBTNState();
}

class _ClickMeBTNState extends State<ClickMeBTN> {
  bool start = false;
  @override
  Widget build(BuildContext context) {
    btn() {
      return MaterialButton(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(.5.w)),
        color: Colors.black,
        onPressed: () {
          start = true;

          setState(() {});
        },
        child: Text(
          "Click Me",
          style: GoogleFonts.cairo(fontSize: 5.sp, color: Colors.cyan),
        ),
      );
    }

    return start ? FallingWidget(start: start, widget: btn()) : btn();
  }
}
