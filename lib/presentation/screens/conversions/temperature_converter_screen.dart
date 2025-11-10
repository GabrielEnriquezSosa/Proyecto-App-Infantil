import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  double grados = 0;
  double farenheit = 0;
  final TextEditingController gradosController = TextEditingController();
  final TextEditingController farenheitController = TextEditingController();

  void convertirTemperatura() {
    final double grados = double.tryParse(gradosController.text) ?? 0.0;
    setState(() {
      farenheit = (grados * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/temperature.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Conversor de Temperatura',
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Grados",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Exo2',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: gradosController,
                        onChanged: (value) => convertirTemperatura(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Introduce el valor',
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
                SizedBox(width: 20),
                Text(
                  "Son",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Farenheit",
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
                              "$farenheit",
                              style: TextStyle(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
