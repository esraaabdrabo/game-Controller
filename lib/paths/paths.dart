import 'package:flutter/material.dart';

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()..lineTo(0, size.height);
    Offset startp1 = Offset(size.width * .05, size.height * .90);
    Offset endp1 = Offset(size.width * .15, size.height * .20);

    path.quadraticBezierTo(startp1.dx, startp1.dy, endp1.dx, endp1.dy);
    Offset startp2 = Offset(size.width * .50, size.height * .60);
    Offset endp2 = Offset(size.width, size.height * .90);
    path.quadraticBezierTo(startp2.dx, startp2.dy, endp2.dx, endp2.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()..lineTo(0, size.height);
    Offset startp1 = Offset(size.width * .05, size.height);
    Offset endp1 = Offset(size.width * .35, size.height * .85);
    path.quadraticBezierTo(startp1.dx, startp1.dy, endp1.dx, endp1.dy);
    Offset startp2 = Offset(size.width * .65, size.height * .70);
    Offset endp2 = Offset(size.width, size.height * .95);
    path.quadraticBezierTo(startp2.dx, startp2.dy, endp2.dx, endp2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
