import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.red, Colors.black, Colors.white])),
      margin: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
      alignment: Alignment.center,
      height: 100.h,
      width: 100.w,
      child: Text(
        "ESRAA \n ABDRABO",
        textAlign: TextAlign.center,
        style: GoogleFonts.podkova(shadows: [
          const BoxShadow(
              offset: Offset(5, 2), blurRadius: 5, color: Colors.red),
          const BoxShadow(
              offset: Offset(-1, 2),
              blurRadius: 2,
              color: Color.fromARGB(144, 255, 255, 255))
        ], fontSize: 50.sp, color: Colors.white),
      ),
    );
  }
}
