import 'dart:math';

class CalculateVolumeUseCase {
  double execute({
    required String figure,
    required Map<String, double> params,
  }) {
    switch (figure) {
      case 'Cubo':
        return pow(params['lado'] ?? 0, 3).toDouble();
      case 'Cilindro':
        return pi * pow(params['radio'] ?? 0, 2) * (params['altura'] ?? 0);
      case 'Esfera':
        return (4 / 3) * pi * pow(params['radio'] ?? 0, 3);
      default:
        return 0;
    }
  }
}
