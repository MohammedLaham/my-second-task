import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 189, 33, 174)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9987500, size.height * 0.5920000);
    path0.quadraticBezierTo(
        size.width * 0.9987500, size.height * 0.0640000, size.width, 0);
    path0.lineTo(size.width * 0.0262500, 0);
    path0.quadraticBezierTo(size.width * 0.0290625, size.height * 0.5215000,
        size.width * 0.0287500, size.height * 0.6960000);
    path0.cubicTo(
        size.width * 0.2709375,
        size.height * 0.3395000,
        size.width * 0.8009375,
        size.height * 0.9635000,
        size.width * 0.9987500,
        size.height * 0.5920000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
