import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'background.dart';
import 'foregrounde.dart';

class EXAMPLE1 extends StatefulWidget {
  const EXAMPLE1({super.key});

  @override
  State<EXAMPLE1> createState() => _EXAMPLE1State();
}

class _EXAMPLE1State extends State<EXAMPLE1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
      child: Stack(
        children: const [Background(), ForeGround()],
      ),
    );
  }
}
