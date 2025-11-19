import 'dart:math';
import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  final String figure;
  final Color color;

  ShapePainter({required this.figure, this.color = Colors.orange});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    switch (figure) {
      case 'Cuadrado':
        final side = min(size.width, size.height);
        final rect = Rect.fromCenter(center: center, width: side, height: side);
        canvas.drawRect(rect, paint);
        break;
      case 'Rectángulo':
        final rect = Rect.fromLTWH(
          size.width / 17,
          size.height / 5.5,
          size.width / 1.1,
          size.height / 1.5,
        );
        canvas.drawRect(rect, paint);
        break;
      case 'Triángulo':
        final path = Path();
        path.moveTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.close();
        canvas.drawPath(path, paint);
        break;
      case 'Círculo':
        canvas.drawCircle(center, radius, paint);
        break;

      case 'Pentágono':
        _drawPolygon(canvas, size, 5, paint);
        break;
      case 'Hexágono':
        _drawPolygon(canvas, size, 6, paint);
        break;
      case 'Cubo':
        final side = min(size.width, size.height) * 0.6;
        final rect = Rect.fromCenter(center: center, width: side, height: side);
        canvas.drawRect(rect, paint);
        final paint2 = Paint()
          ..color = color.withOpacity(0.5)
          ..style = PaintingStyle.fill;
        final path = Path();
        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.left + side * 0.4, rect.top - side * 0.4);
        path.lineTo(rect.right + side * 0.4, rect.top - side * 0.4);
        path.lineTo(rect.right, rect.top);
        path.close();
        canvas.drawPath(path, paint2);
        final path2 = Path();
        path2.moveTo(rect.right, rect.top);
        path2.lineTo(rect.right + side * 0.4, rect.top - side * 0.4);
        path2.lineTo(rect.right + side * 0.4, rect.bottom - side * 0.4);
        path2.lineTo(rect.right, rect.bottom);
        path2.close();
        canvas.drawPath(path2, paint2);
        break;
      case 'Cilindro':
        final rect = Rect.fromCenter(
            center: center,
            width: size.width * 0.6,
            height: size.height * 0.8);
        canvas.drawRect(rect, paint);
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(center.dx, rect.top),
                width: rect.width,
                height: rect.height * 0.2),
            paint);
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(center.dx, rect.bottom),
                width: rect.width,
                height: rect.height * 0.2),
            paint);
        break;
      case 'Esfera':
        final gradient = RadialGradient(
          center: const Alignment(0.5, -0.5),
          radius: 0.8,
          colors: [
            Colors.white,
            color,
          ],
        );
        paint.shader = gradient.createShader(Rect.fromCircle(center: center, radius: radius));
        canvas.drawCircle(center, radius, paint);
        break;
    }
  }

  void _drawPolygon(Canvas canvas, Size size, int sides, Paint paint) {
    final path = Path();
    final radius = min(size.width / 2, size.height / 2);
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;

    final startPoint = Offset(
      center.dx + radius * cos(-pi / 2),
      center.dy + radius * sin(-pi / 2),
    );
    path.moveTo(startPoint.dx, startPoint.dy);

    for (int i = 1; i <= sides; i++) {
      final x = center.dx + radius * cos(-pi / 2 + angle * i);
      final y = center.dy + radius * sin(-pi / 2 + angle * i);
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is ShapePainter && oldDelegate.figure != figure;
  }
}
