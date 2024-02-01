import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Radius radiusBotonBlanco = Radius.circular(60);
    const Radius radiusRectanguloRosa = Radius.circular(50);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: Material(
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  BotonRosado(radius: radiusRectanguloRosa),
                  Positioned(
                    left: 30,
                    child: BotonBlancoNegro(radius: radiusBotonBlanco),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BotonBlancoNegro extends StatelessWidget {
  const BotonBlancoNegro({
    super.key,
    required this.radius,
  });

  final Radius radius;

  @override
  Widget build(BuildContext context) {
    const double widthAndHeight = 140;
    return SizedBox(
      height: widthAndHeight,
      width: widthAndHeight,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(3.9, 3.9), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: radius,
                topRight: radius,
                bottomRight: radius,
              ),
            ),
            child: const PlayIconTriangle(),
          ),
        ),
      ),
    );
  }
}

class PlayIconTriangle extends StatelessWidget {
  const PlayIconTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PlayTrianglePainter(),
      size: const Size(70, 70),
    );
  }
}

class PlayTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var path = Path();
    final double x = size.width;
    final double y = size.height;

    final double triangleWidth = size.width * 0.22;
    final double triangleHeight = size.height * 0.45;

    final double centerX = x / 1.9;
    final double centerY = y / 2;

    path.moveTo(centerX - triangleWidth / 2, centerY + triangleHeight / 2);
    path.lineTo(centerX + triangleWidth / 2, centerY);
    path.lineTo(centerX - triangleWidth / 2, centerY - triangleHeight / 2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BotonRosado extends StatelessWidget {
  const BotonRosado({
    super.key,
    required this.radius,
  });

  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 350,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            bottomRight: radius,
          ),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft, // Inicio del gradiente
            end: Alignment.centerRight, // Fin del gradiente
            colors: [
              Color(0xffFFC7A3), // Primer color
              Color(0xffFF9CA5), // Segundo color
            ],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 100),
              Text(
                'PLAY NOW',
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
