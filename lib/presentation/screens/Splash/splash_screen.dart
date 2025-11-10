import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/image_presentation.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Instituto Tecnologico de Tuxtepec',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0x5F000000),
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
            Image.asset('assets/img/mundo_magico.png', height: 170),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Mis Primeros Pasos En El Mundo de las',
                style: TextStyle(
                  fontSize: 33,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Matematicas',
                style: TextStyle(
                  fontSize: 33,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.go("/home");
              },
              child: Text('Entrar', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
