import 'package:flutter/material.dart';

class DistancesScreen extends StatefulWidget {
  const DistancesScreen({super.key});

  @override
  State<DistancesScreen> createState() => _DistancesScreenState();
}

class _DistancesScreenState extends State<DistancesScreen> {
  double distancia = 0;
  final TextEditingController metaController = TextEditingController();
  final TextEditingController salidaController = TextEditingController();
  void convertirTemperatura() {
    final double meta = double.tryParse(metaController.text) ?? 0.0;
    final double salida = double.tryParse(salidaController.text) ?? 0.0;
    setState(() {
      distancia = meta - salida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/distances.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Distancias',
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
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Meta: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          TextField(
                            controller: metaController,
                            onChanged: (value) => convertirTemperatura(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Introduce el valor de la meta',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Column(
                  children: [
                    Text(
                      "Salida:",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: salidaController,
                      onChanged: (value) => convertirTemperatura(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Introduce el valor de salida',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 300),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        "Cuanto falta para llegar? ",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Exo2',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          Container(
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
                                "$distancia metros",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Exo2',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
