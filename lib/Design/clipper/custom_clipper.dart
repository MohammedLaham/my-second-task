import 'package:flutter/cupertino.dart';

class AppCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(0, size.height / 2);
    p.cubicTo(size.width / 3, 0.5 * (size.height / 2), 3 * (size.width / 4),
        size.height / 1.5, size.width, size.height * 0.5);
    p.lineTo(size.width, 0);
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}