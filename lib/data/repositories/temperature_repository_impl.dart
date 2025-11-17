import 'package:proyecto_infantil/domain/entities/temperature.dart';
import 'package:proyecto_infantil/domain/repositories/temperature_repository.dart';

class TemperatureRepositoryImpl extends TemperatureRepository {
  @override
  double calculateTemperature(Temperature temperature) {
    if (temperature.unit == "celsiusF") {
      return (temperature.value * 9 / 5) + 32;
    } else if (temperature.unit == "FahrenheitC") {
      return (temperature.value - 32) * 5 / 9;
    } else if (temperature.unit == "CKelvin") {
      return temperature.value + 273.15;
    } else if (temperature.unit == "KCelsius") {
      return temperature.value - 273.15;
    } else if (temperature.unit == "FKelvin") {
      return (temperature.value - 32) * 5 / 9 + 273.15;
    } else {
      throw Exception("Unidad de temperatura no válida");
    }
  }
}
