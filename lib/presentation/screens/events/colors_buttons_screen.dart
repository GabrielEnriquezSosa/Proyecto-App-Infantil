import 'package:flutter/material.dart';
import 'package:proyecto_infantil/presentation/widgets/button_circle.dart';

class ColorsButtonsScreen extends StatelessWidget {
  const ColorsButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/Fondo_BotonesColores.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Selecciona un color',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ButtonCircle(color: Colors.yellow, colors: 'Amarillo'),
              SizedBox(height: 30),
              ButtonCircle(color: Colors.pink, colors: 'Rosado'),
              SizedBox(height: 30),
              ButtonCircle(color: Colors.orange, colors: 'Naranja'),
            ],
          ),
        ),
      ),
    );
  }
}
