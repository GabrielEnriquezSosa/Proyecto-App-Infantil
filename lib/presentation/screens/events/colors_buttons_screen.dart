import 'package:flutter/material.dart';
import 'package:proyecto_infantil/presentation/widgets/button_circle.dart';

class ColorsButtonsScreen extends StatelessWidget {
  const ColorsButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/buttons_colors.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Botones de Colores',
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70),

                ButtonCircle(color: Colors.yellow, colors: 'Amarillo'),
                SizedBox(height: 30),
                ButtonCircle(color: Colors.pink, colors: 'Rosado'),
                SizedBox(height: 30),
                ButtonCircle(color: Colors.orange, colors: 'Naranja'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
