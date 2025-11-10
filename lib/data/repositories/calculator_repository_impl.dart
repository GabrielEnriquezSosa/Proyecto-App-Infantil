import 'package:proyecto_infantil/domain/entities/operation.dart';
import 'package:proyecto_infantil/domain/repositories/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  double calculate(Operation operation) {
    switch (operation.operator) {
      case '+':
        return operation.num1 + operation.num2;
      case '-':
        return operation.num1 - operation.num2;
      case '×':
        return operation.num1 * operation.num2;
      case '÷':
        if (operation.num2 == 0) throw Exception("División entre cero");
        return operation.num1 / operation.num2;
      default:
        throw Exception("Operador no válido");
    }
  }
}
