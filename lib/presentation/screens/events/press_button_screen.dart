import 'package:flutter/material.dart';

class PressButtonScreen extends StatefulWidget {
  const PressButtonScreen({super.key});

  @override
  State<PressButtonScreen> createState() => _PressButtonScreenState();
}

class _PressButtonScreenState extends State<PressButtonScreen> {
  int calificacion = 0;
  String Saludo = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/img/Fondo_Botones.png"),
          fit: BoxFit.fill,
          opacity: 0.8,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Presiona El Botón",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/img/logo_tecnm.png",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  Expanded(
                    child: Text(
                      "Técnologico Nacional de México",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Instituto Técnologico de Tuxtepec",
                style: TextStyle(
                  fontSize: 33,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  setState(() {
                    calificacion = 10;
                    Saludo =
                        "Hola, Bienvenido a la Universidad Tecnologica de Tuxtepec";
                  });
                },
                style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Click aquí",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      Saludo,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text(
                "En esta asignatura otuviste una calificación de:",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$calificacion",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    calificacion = 0;
                    Saludo = "";
                  });
                },
                child: Text(
                  "Borrar",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/img/logo_ittux.png",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
