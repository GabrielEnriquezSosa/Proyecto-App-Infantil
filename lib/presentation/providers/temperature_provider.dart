import 'package:flutter/material.dart';
import 'package:proyecto_infantil/data/repositories/temperature_repository_impl.dart';
import 'package:proyecto_infantil/domain/entities/temperature.dart';
import 'package:proyecto_infantil/domain/usecases/temperature_operation.dart';

class TemperatureProvider extends ChangeNotifier {
  TemperatureRepositoryImpl temperatureRepository = TemperatureRepositoryImpl();
  late final TemperatureOperation temperatureOperation;
  double _farenheit = 0;
  double _grados = 0;

  TemperatureProvider() {
    temperatureOperation = TemperatureOperation(temperatureRepository);
  }

  void convertCelsiusToFahrenheit(
    String celsiusText,
    TextEditingController controller,
  ) {
    final double celsius = double.tryParse(controller.text) ?? 0.0;
    _farenheit = temperatureOperation.call(
      Temperature(value: celsius, unit: "celsiusF"),
    );
    _grados = temperatureOperation.call(
      Temperature(value: _farenheit, unit: "FahrenheitC"),
    );
    notifyListeners();
  }

  void convertFahrenheitToCelsius(
    String fahrenheitText,
    TextEditingController controller,
  ) {
    final double fahrenheit = double.tryParse(controller.text) ?? 0.0;
    _grados = temperatureOperation.call(
      Temperature(value: fahrenheit, unit: "FahrenheitC"),
    );
    _farenheit = temperatureOperation.call(
      Temperature(value: _grados, unit: "celsiusF"),
    );
    notifyListeners();
  }

  double get farenheit => _farenheit;
  double get grados => _grados;
}
