import 'dart:math';

class CalculateAreaUseCase {
  double execute({
    required String figure,
    required Map<String, double> params,
  }) {
    switch (figure) {
      case 'Rectángulo':
        return (params['base'] ?? 0) * (params['altura'] ?? 0);
      case 'Triángulo':
        return ((params['base'] ?? 0) * (params['altura'] ?? 0)) / 2;
      case 'Cuadrado':
        return pow(params['lado'] ?? 0, 2).toDouble();
      case 'Círculo':
        return pi * pow(params['radio'] ?? 0, 2);
      case 'Pentágono':
        final perimeter = 5 * (params['lado'] ?? 0);
        return (perimeter * (params['apotema'] ?? 0)) / 2;
      case 'Hexágono':
        final perimeter = 6 * (params['lado'] ?? 0);
        return (perimeter * (params['apotema'] ?? 0)) / 2;
      default:
        return 0;
    }
  }
}
