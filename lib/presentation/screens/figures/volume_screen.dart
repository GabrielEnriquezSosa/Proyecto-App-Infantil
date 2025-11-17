import 'package:flutter/material.dart';
import 'package:proyecto_infantil/presentation/widgets/texfield_data.dart';
import 'package:proyecto_infantil/presentation/widgets/view_container.dart';

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
                          TexfieldData(
                            controller: areaController,
                            labelText: 'Introduce el valor',
                            keyboardType: TextInputType.number,
                            (value) => _calcularVolumen(),
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
                          TexfieldData(
                            controller: alturaController,
                            labelText: 'Introduce el valor',
                            keyboardType: TextInputType.number,
                            (value) => _calcularVolumen(),
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
                      child: ViewContainer(text: volumen.toStringAsFixed(2)),
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
