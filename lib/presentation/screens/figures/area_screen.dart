import 'package:flutter/material.dart';

class AreaGeometricFiguresScreen extends StatefulWidget {
  const AreaGeometricFiguresScreen({super.key});

  @override
  State<AreaGeometricFiguresScreen> createState() =>
      _AreaGeometricFiguresScreenState();
}

class _AreaGeometricFiguresScreenState
    extends State<AreaGeometricFiguresScreen> {
  double areaRectangulo = 0;
  double areaTriangulo = 0;
  double areaCirculo = 0;
  final TextEditingController baseController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController ladoController = TextEditingController();
  void CalcularArea() {
    final double base = double.tryParse(baseController.text) ?? 0.0;
    final double altura = double.tryParse(alturaController.text) ?? 0.0;
    final double lado = double.tryParse(ladoController.text) ?? 0.0;
    setState(() {
      areaRectangulo = base * altura;
      areaTriangulo = (base * altura) / 2;
      areaCirculo = 3.1416 * (lado * lado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/area.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Area de Figuras Geometricas',
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 33,
              fontFamily: 'Exo2',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0x00000000),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.red),
                            width: 150,
                            height: 100,
                          ),
                          Text(
                            'Area = $areaRectangulo',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            'Area = $areaCirculo',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomPaint(
                            size: const Size(100, 100),
                            painter: TrianglePainter(),
                          ),
                          Text(
                            'Area = $areaTriangulo',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Base",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: baseController,
                            onChanged: (value) => CalcularArea(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Introduce la Base',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Altura",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: alturaController,
                            onChanged: (value) => CalcularArea(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Introduce la Altura',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Radio",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: ladoController,
                            onChanged: (value) => CalcularArea(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Introduce el Radio',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.purple
          ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
