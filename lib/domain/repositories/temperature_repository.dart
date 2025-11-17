import 'package:proyecto_infantil/domain/entities/temperature.dart';

abstract class TemperatureRepository {
  double calculateTemperature(Temperature temperature);
}
