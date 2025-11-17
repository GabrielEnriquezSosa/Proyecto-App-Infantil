import 'package:flutter/material.dart';
import 'package:proyecto_infantil/data/repositories/temperature_repository_impl.dart';
import 'package:proyecto_infantil/domain/entities/temperature.dart';
import 'package:proyecto_infantil/domain/usecases/temperature_operation.dart';

import 'package:proyecto_infantil/presentation/widgets/conversions/unit_dropdown.dart';
import 'package:proyecto_infantil/presentation/widgets/texfield_data.dart';
import 'package:proyecto_infantil/presentation/widgets/view_container.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';

  final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  void _convert() {
    final value = double.tryParse(_controller.text);
    if (value == null) {
      setState(() {
        _result = 'Por favor, introduce un número válido';
      });
      return;
    }

    String unit;
    if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      unit = 'celsiusF';
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      unit = 'FahrenheitC';
    } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
      unit = 'CKelvin';
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
      unit = 'KCelsius';
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
      unit = 'FKelvin';
    } else if (_fromUnit == _toUnit) {
      _result = value.toStringAsFixed(2);
      setState(() {});
      return;
    } else {
      unit = 'KtoF';
    }
    if (unit == 'KtoF') {
      final tempInCelsius = value - 273.15;
      _result = (tempInCelsius * 9 / 5 + 32).toStringAsFixed(2);
    } else {
      final temperature = Temperature(value: value, unit: unit);
      final temperatureOperation = TemperatureOperation(
        TemperatureRepositoryImpl(),
      );
      final result = temperatureOperation(temperature);
      _result = result.toStringAsFixed(2);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/temperature_img/Fondo.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Temperatura',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/img/temperature_img/Capymat-temperatura.png',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Conversor',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 20),
                Text(
                  'de',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: const Color.fromARGB(255, 203, 120, 90),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              'Temperatura',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UnitDropdown(
                    value: _fromUnit,
                    items: _units,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _fromUnit = newValue;
                        });
                      }
                    },
                  ),
                  const Icon(Icons.swap_horiz),
                  UnitDropdown(
                    value: _toUnit,
                    items: _units,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _toUnit = newValue;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Flexible(
                    child: TexfieldData(
                      (value) => null,
                      controller: _controller,
                      labelText: 'Temperatura',
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  SizedBox(width: 30),
                  Flexible(child: ViewContainer(text: _result)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _convert, child: const Text('Convertir')),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Transform.flip(
                    flipX: true,
                    flipY: false,
                    child: Image.asset(
                      'assets/img/temperature_img/Capymat-Playero.png',
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(width: 60),
                Expanded(
                  child: Image.asset(
                    'assets/img/temperature_img/Capymat-abrigo.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
