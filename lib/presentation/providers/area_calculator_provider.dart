import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:proyecto_infantil/domain/usecases/calculate_area_usecase.dart';
import 'package:proyecto_infantil/domain/usecases/generate_question_usecase.dart';

class AreaCalculatorState {
  final List<String> figures;
  final String selectedFigure;
  final Map<String, int> params;
  final String message;
  final bool showResult;
  final TextEditingController answerController;
  final String formula;

  const AreaCalculatorState({
    required this.figures,
    required this.selectedFigure,
    required this.params,
    required this.message,
    required this.showResult,
    required this.answerController,
    required this.formula,
  });

  AreaCalculatorState copyWith({
    List<String>? figures,
    String? selectedFigure,
    Map<String, int>? params,
    String? message,
    bool? showResult,
    TextEditingController? answerController,
    String? formula,
  }) {
    return AreaCalculatorState(
      figures: figures ?? this.figures,
      selectedFigure: selectedFigure ?? this.selectedFigure,
      params: params ?? this.params,
      message: message ?? this.message,
      showResult: showResult ?? this.showResult,
      answerController: answerController ?? this.answerController,
      formula: formula ?? this.formula,
    );
  }
}

class AreaCalculatorNotifier extends StateNotifier<AreaCalculatorState> {
  final GenerateQuestionUseCase _generateQuestionUseCase;
  final CalculateAreaUseCase _calculateAreaUseCase;

  AreaCalculatorNotifier(
    this._generateQuestionUseCase,
    this._calculateAreaUseCase,
  ) : super(
        AreaCalculatorState(
          figures: [
            'Rectángulo',
            'Triángulo',
            'Cuadrado',
            'Círculo',
            'Pentágono',
            'Hexágono',
          ],
          selectedFigure: 'Rectángulo',
          params: {},
          message: '',
          showResult: false,
          answerController: TextEditingController(),
          formula: 'Área = base × altura',
        ),
      ) {
    generateNewQuestion();
  }

  void generateNewQuestion() {
    final question = _generateQuestionUseCase.execute(state.selectedFigure);
    state = state.copyWith(params: question, message: '', showResult: false);
    state.answerController.clear();
  }

  void setSelectedFigure(String figure) {
    final newFormula = _getFormulaForFigure(figure);
    state = state.copyWith(selectedFigure: figure, formula: newFormula);
    generateNewQuestion();
  }

  String _getFormulaForFigure(String figure) {
    switch (figure) {
      case 'Rectángulo':
        return 'Área = base × altura';
      case 'Triángulo':
        return 'Área = (base × altura) / 2';
      case 'Cuadrado':
        return 'Área = lado × lado';
      case 'Círculo':
        return 'Área = π × radio²';
      case 'Pentágono':
        return 'Área = ((perímetro × apotema) / 2) x 5';
      case 'Hexágono':
        return 'Área = ((perímetro × apotema) / 2) x 6';
      default:
        return '';
    }
  }

  void checkAnswer() {
    final userAnswer = double.tryParse(state.answerController.text);
    if (userAnswer == null) {
      state = state.copyWith(
        message: 'Por favor, introduce un número válido.',
        showResult: true,
      );
      return;
    }

    final paramsAsDouble = state.params.map(
      (key, value) => MapEntry(key, value.toDouble()),
    );

    final correctAnswer = _calculateAreaUseCase.execute(
      figure: state.selectedFigure,
      params: paramsAsDouble,
    );

    if ((userAnswer - correctAnswer).abs() < 0.01) {
      state = state.copyWith(
        message: '¡Correcto! ¡Muy bien!',
        showResult: true,
      );
    } else {
      state = state.copyWith(
        message:
            'Incorrecto. La respuesta correcta es ${correctAnswer.toStringAsFixed(2)}. ¡Inténtalo de nuevo!',
        showResult: true,
      );
    }
  }

  @override
  void dispose() {
    state.answerController.dispose();
    super.dispose();
  }
}

final areaCalculatorProvider =
    StateNotifierProvider<AreaCalculatorNotifier, AreaCalculatorState>((ref) {
      final generateQuestionUseCase = GenerateQuestionUseCase();
      final calculateAreaUseCase = CalculateAreaUseCase();
      return AreaCalculatorNotifier(
        generateQuestionUseCase,
        calculateAreaUseCase,
      );
    });
