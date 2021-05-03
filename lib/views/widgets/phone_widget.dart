import 'package:flutter/material.dart';
import 'package:portfolio/utils/consts.dart';

class PhoneWidget extends StatefulWidget {
  final Widget? content;

  PhoneWidget({Key? key, this.content}) : super(key: key);

  @override
  _PhoneWidgetState createState() => _PhoneWidgetState(content: this.content);
}

class _PhoneWidgetState extends State<PhoneWidget> {

  final Widget? content;

  _PhoneWidgetState({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black,
        border: Border.all(color: Colors.black, width: 10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: COLORS.LIGHT_BG,
        ),
        child: Column(
          children: [
            Container(
              height: 10,
              width: 100,
              child: CustomPaint(
                painter: FrontCamera(),
              ),
            ),
            Expanded(
              child: Center(
                  child: content ?? Container()
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                width: 80,
                height: 5,
                child: CustomPaint(
                  painter: BottomNav(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FrontCamera extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(size.width * 0.01, 0);
    path.quadraticBezierTo(
        0, size.height * 0.5, size.width * 0.05, size.height);
    path.lineTo(size.width * 0.95, size.height);
    path.quadraticBezierTo(size.width, size.height * 0.5, size.width * 0.99, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomNav extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(size.width / 20, 0);
    path.quadraticBezierTo(0, size.height / 2, size.width / 20, size.height);
    path.lineTo((size.width / 20) * 19, size.height);
    path.quadraticBezierTo(
        size.width, size.height / 2, (size.width / 20) * 19, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
