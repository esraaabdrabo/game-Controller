import 'package:flutter/material.dart';

class Note extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.teal;
    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 50);
    canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: 3000, height: 500), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
