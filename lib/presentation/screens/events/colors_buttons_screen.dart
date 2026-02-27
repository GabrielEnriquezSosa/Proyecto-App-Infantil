import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyecto_infantil/presentation/widgets/button_circle.dart';

class ColorsButtonsScreen extends StatefulWidget {
  const ColorsButtonsScreen({super.key});

  @override
  State<ColorsButtonsScreen> createState() => _ColorsButtonsScreenState();
}

class _ColorsButtonsScreenState extends State<ColorsButtonsScreen> {
  final List<Map<String, dynamic>> _availableColors = [
    {'color': Colors.yellow, 'name': 'Amarillo'},
    {'color': Colors.pink, 'name': 'Rosado'},
    {'color': Colors.orange, 'name': 'Naranja'},
    {'color': Colors.red, 'name': 'Rojo'},
    {'color': Colors.blue, 'name': 'Azul'},
    {'color': Colors.green, 'name': 'Verde'},
    {'color': Colors.purple, 'name': 'Morado'},
    {'color': Colors.brown, 'name': 'Café'},
    {'color': Colors.cyan, 'name': 'Cian'},
    {'color': Colors.teal, 'name': 'Verde Azulado'},
  ];

  List<Map<String, dynamic>> _currentColors = [];

  @override
  void initState() {
    super.initState();
    _randomizeColors();
  }

  void _randomizeColors() {
    final random = Random();
    final List<Map<String, dynamic>> shuffled = List.from(_availableColors);
    shuffled.shuffle(random);
    _currentColors = shuffled.take(3).toList();
  }

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
          backgroundColor: const Color(0x00000000),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Selecciona un color',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ButtonCircle(
                color: _currentColors[0]['color'],
                colors: _currentColors[0]['name'],
              ),
              SizedBox(height: 15),
              ButtonCircle(
                color: _currentColors[1]['color'],
                colors: _currentColors[1]['name'],
              ),
              SizedBox(height: 15),
              ButtonCircle(
                color: _currentColors[2]['color'],
                colors: _currentColors[2]['name'],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _randomizeColors();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 11, 64, 107),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Cambiar Colores',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
