import 'dart:math';

class GenerateQuestionUseCase {
  Map<String, int> execute(String figure) {
    final random = Random();
    switch (figure) {
      case 'Rectángulo':
        return {
          'base': random.nextInt(20) + 1,
          'altura': random.nextInt(20) + 1
        };
      case 'Triángulo':
        return {
          'base': random.nextInt(20) + 1,
          'altura': random.nextInt(20) + 1
        };
      case 'Cuadrado':
        return {'lado': random.nextInt(20) + 1};
      case 'Círculo':
        return {'radio': random.nextInt(20) + 1};
      case 'Pentágono':
      case 'Hexágono':
        return {
          'lado': random.nextInt(20) + 1,
          'apotema': random.nextInt(10) + 1
        };
      case 'Cubo':
        return {'lado': random.nextInt(20) + 1};
      case 'Cilindro':
        return {
          'radio': random.nextInt(20) + 1,
          'altura': random.nextInt(20) + 1
        };
      case 'Esfera':
        return {'radio': random.nextInt(20) + 1};
      default:
        return {};
    }
  }
}
