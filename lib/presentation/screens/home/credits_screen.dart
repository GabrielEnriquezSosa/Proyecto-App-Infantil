import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/img/Creditos.png"),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Creditos",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),

        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Desarrolladores:",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/img/Gabo.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/img/Adrian.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Enriquez Sosa Gabriel \n24350401",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Exo2',
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Ruiz Contreras Jorge Adrian \n24350432",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Exo2',
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,

                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/img/Mayolo.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Ferrer Gutiérrez Mayolo \n24350404",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Text(
                  'Diseñado para la Materia de Programación del Tecnológico Nacional de México',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
