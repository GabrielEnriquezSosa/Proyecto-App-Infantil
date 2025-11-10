import 'package:flutter/material.dart';

class VolumeScreen extends StatefulWidget {
  const VolumeScreen({super.key});

  @override
  State<VolumeScreen> createState() => _VolumeScreenState();
}

class _VolumeScreenState extends State<VolumeScreen> {
  final TextEditingController areaController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  double volumen = 0.0;

  void _calcularVolumen() {
    final double area = double.tryParse(areaController.text) ?? 0.0;
    final double altura = double.tryParse(alturaController.text) ?? 0.0;
    setState(() {
      volumen = area * altura;
    });
  }

  @override
  void dispose() {
    areaController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/volume.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            '¿Cual es el Volumen de esta figura?',
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
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Area: ",
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
                            controller: areaController,
                            onChanged: (value) => _calcularVolumen(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Introduce el valor',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Altura: ",
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
                            controller: alturaController,
                            onChanged: (value) => _calcularVolumen(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Introduce el valor',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: const TextStyle(
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
                const SizedBox(height: 30),
                Image.asset('assets/img/cilindro.png', height: 170),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "Volumen =  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Flexible(
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
                            volumen.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
