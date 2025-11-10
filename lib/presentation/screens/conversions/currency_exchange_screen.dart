import 'package:flutter/material.dart';

class CurrencyExchangeScreen extends StatefulWidget {
  const CurrencyExchangeScreen({super.key});

  @override
  State<CurrencyExchangeScreen> createState() => _CurrencyExchangeScreenState();
}

class _CurrencyExchangeScreenState extends State<CurrencyExchangeScreen> {
  final TextEditingController pesosController = TextEditingController();
  double dolares = 0.0;
  final double tasaDeCambio = 18.51;

  void convertirMoneda() {
    final double pesos = double.tryParse(pesosController.text) ?? 0.0;
    setState(() {
      dolares = pesos / tasaDeCambio;
    });
  }

  @override
  void dispose() {
    pesosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/currency_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Cambio de Moneda',
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
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          const Text(
                            "Pesos MXN",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: pesosController,
                            onChanged: (value) => convertirMoneda(),
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
                      "Es igual a",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        children: [
                          const Text(
                            "Dolares USD",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
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
                                dolares.toStringAsFixed(2),
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
