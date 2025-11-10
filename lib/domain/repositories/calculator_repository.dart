import 'package:proyecto_infantil/domain/entities/operation.dart';

abstract class CalculatorRepository {
  double calculate(Operation operation);
}
