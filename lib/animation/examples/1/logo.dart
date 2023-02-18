import 'package:esraaabdrabo/animation/examples/1/fallingWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  bool start = false;

  @override
  Widget build(BuildContext context) {
    logo() {
      return InkWell(
          child: FlutterLogo(size: 15.w),
          onTap: () {
            start = true;
            setState(() {});
          });
    }

    return start
        ? FallingWidget(milliSeconds: 2500, start: start, widget: logo())
        : logo();
  }
}
