import 'package:flutter/material.dart';

import 'dart:ui' as ui;

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * 0.8686815, 0);
    path_0.cubicTo(
        size.width * 0.8686815,
        0,
        size.width * 0.9283764,
        size.height * 0.5677403,
        size.width * 0.8041887,
        size.height * 0.6963002);
    path_0.cubicTo(size.width * 0.6591467, size.height * 0.8464488, 0,
        size.height * 0.7968353, 0, size.height * 0.7968353);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffc4f1d7).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1215637, size.height * 0.03018983);
    path_1.cubicTo(
        size.width * 0.1986451,
        size.height * 0.03166810,
        size.width * 0.3977537,
        size.height * 0.03877258,
        size.width * 0.5583066,
        size.height * -0.06520744);
    path_1.lineTo(size.width * 0.3532116, size.height * 0.2188733);
    path_1.cubicTo(
        size.width * 0.2640077,
        size.height * 0.3269463,
        size.width * 0.2102636,
        size.height * 0.4509766,
        size.width * 0.02066043,
        size.height * 0.5106768);
    path_1.cubicTo(
        size.width * 0.1778264,
        size.height * 0.3570717,
        size.width * 0.1491964,
        size.height * 0.1202846,
        size.width * 0.1215637,
        size.height * 0.03018983);
    path_1.close();
    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9183110, size.height * 0.2137950),
        Offset(size.width * -0.02917800, size.height * 0.8977720), [
      Color(0xffc4f1d7).withOpacity(1),
      Color(0xff96b8a5).withOpacity(1),
      Color(0xffc4f1d7).withOpacity(1)
    ], [
      0,
      0.5,
      1
    ]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
