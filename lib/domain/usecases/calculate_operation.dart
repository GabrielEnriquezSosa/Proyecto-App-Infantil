import 'package:proyecto_infantil/domain/entities/operation.dart';
import 'package:proyecto_infantil/domain/repositories/calculator_repository.dart';

class CalculateOperation {
  final CalculatorRepository repository;

  CalculateOperation(this.repository);

  double call(Operation operation) {
    return repository.calculate(operation);
  }
}
