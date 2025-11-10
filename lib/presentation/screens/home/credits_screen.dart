import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Creditos",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Exo2',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(114, 213, 159, 9),
      ),
      body: Container(
        decoration: BoxDecoration(color: const Color(0xDDD59E09)),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 100),

              Text(
                "Enriquez Sosa Gabriel \n24350401",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
              Text(
                "Ruiz Contreras Jorge Adrian \n24350432",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),

              Text(
                "Ferrer Gutiérrez Mayolo \n24350404",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
