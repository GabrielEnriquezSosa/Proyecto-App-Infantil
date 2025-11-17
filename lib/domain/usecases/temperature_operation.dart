import 'package:proyecto_infantil/domain/entities/temperature.dart';
import 'package:proyecto_infantil/domain/repositories/temperature_repository.dart';

class TemperatureOperation {
  final TemperatureRepository repository;

  TemperatureOperation(this.repository);

  double call(Temperature temperature) {
    return repository.calculateTemperature(temperature);
  }
}
