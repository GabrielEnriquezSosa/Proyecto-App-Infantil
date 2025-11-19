import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/domain/entities/distance.dart';
import 'package:proyecto_infantil/presentation/providers/distance_provider.dart';
import 'package:proyecto_infantil/presentation/widgets/view_container.dart';

class DistancesScreen extends ConsumerWidget {
  const DistancesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distanceState = ref.watch(distanceNotifierProvider);
    final distanceNotifier = ref.read(distanceNotifierProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/Fondo_Distancia.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Conversor de Distancias',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 40,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/img/distance_img/Capymat-Distancia.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '¿Qué Distancia quieres convertir?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Flexible(
                    child: _buildDistanceDropdown(
                      distanceState.from,
                      distanceNotifier.setFromDistance,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'a',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: _buildDistanceDropdown(
                      distanceState.to,
                      distanceNotifier.setToDistance,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '¿Cuánto quieres convertir?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Monto',
                    labelStyle: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onChanged: (value) {
                    distanceNotifier.setAmount(double.tryParse(value) ?? 0.0);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GestureDetector(
                  child: Image.asset(
                    "assets/img/curency_img/Capymat-convertir.png",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    distanceNotifier.convert();
                  },
                ),
              ),
              const SizedBox(height: 10),
              if (distanceState.isLoading)
                const CircularProgressIndicator()
              else
                Flexible(
                  child: ViewContainer(
                    text:
                        'Resultado: ${distanceState.convertedValue.toStringAsFixed(2)}',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDistanceDropdown(
    DistanceType value,
    void Function(DistanceType) onChanged,
  ) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton<DistanceType>(
            value: value,
            isExpanded: true,
            items:
                DistanceType.values.map((DistanceType distance) {
                  return DropdownMenuItem<DistanceType>(
                    value: distance,
                    child: Text(distance.name.toUpperCase()),
                  );
                }).toList(),
            onChanged: (DistanceType? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            underline: Container(),
          ),
        ),
      ),
    );
  }
}
