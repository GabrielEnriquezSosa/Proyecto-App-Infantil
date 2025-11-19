import 'dart:math';
import 'package:flutter_riverpod/legacy.dart';
import 'package:proyecto_infantil/domain/usecases/calculate_volume_usecase.dart';
import 'package:proyecto_infantil/domain/usecases/generate_question_usecase.dart';

class VolumeCalculatorState {
  final List<String> figures;
  final String selectedFigure;
  final Map<String, int> params;
  final String message;
  final bool showResult;
  final List<double> answers;
  final double correctAnswer;
  final String formula;
  final double? selectedAnswer;

  const VolumeCalculatorState({
    required this.figures,
    required this.selectedFigure,
    required this.params,
    required this.message,
    required this.showResult,
    required this.answers,
    required this.correctAnswer,
    required this.formula,
    this.selectedAnswer,
  });

  VolumeCalculatorState copyWith({
    List<String>? figures,
    String? selectedFigure,
    Map<String, int>? params,
    String? message,
    bool? showResult,
    List<double>? answers,
    double? correctAnswer,
    String? formula,
    double? selectedAnswer,
  }) {
    return VolumeCalculatorState(
      figures: figures ?? this.figures,
      selectedFigure: selectedFigure ?? this.selectedFigure,
      params: params ?? this.params,
      message: message ?? this.message,
      showResult: showResult ?? this.showResult,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      formula: formula ?? this.formula,
      selectedAnswer: selectedAnswer,
    );
  }
}

class VolumeCalculatorNotifier extends StateNotifier<VolumeCalculatorState> {
  final GenerateQuestionUseCase _generateQuestionUseCase;
  final CalculateVolumeUseCase _calculateVolumeUseCase;

  VolumeCalculatorNotifier(
    this._generateQuestionUseCase,
    this._calculateVolumeUseCase,
  ) : super(
        VolumeCalculatorState(
          figures: ['Cubo', 'Cilindro', 'Esfera'],
          selectedFigure: 'Cubo',
          params: {},
          message: '',
          showResult: false,
          answers: [],
          correctAnswer: 0,
          formula: 'Volumen = lado³',
          selectedAnswer: null,
        ),
      ) {
    generateNewQuestion();
  }

  void generateNewQuestion() {
    final question = _generateQuestionUseCase.execute(state.selectedFigure);
    final paramsAsDouble = question.map(
      (key, value) => MapEntry(key, value.toDouble()),
    );
    final correctAnswer = _calculateVolumeUseCase.execute(
      figure: state.selectedFigure,
      params: paramsAsDouble,
    );

    final incorrectAnswers = <double>{};
    final random = Random();
    while (incorrectAnswers.length < 2) {
      final randomFactor = random.nextDouble() * 10 + 5;
      final incorrect =
          correctAnswer + (random.nextBool() ? randomFactor : -randomFactor);
      if ((incorrect - correctAnswer).abs() > 0.1 && incorrect > 0) {
        incorrectAnswers.add(incorrect);
      }
    }

    final answers = [correctAnswer, ...incorrectAnswers];
    answers.shuffle();

    state = state.copyWith(
      params: question,
      message: '',
      showResult: false,
      correctAnswer: correctAnswer,
      answers: answers,
      selectedAnswer: null,
    );
  }

  void setSelectedFigure(String figure) {
    final newFormula = _getFormulaForFigure(figure);
    state = state.copyWith(
      selectedFigure: figure,
      formula: newFormula,
      selectedAnswer: null,
    );
    generateNewQuestion();
  }

  String _getFormulaForFigure(String figure) {
    switch (figure) {
      case 'Cubo':
        return 'Volumen = lado³';
      case 'Cilindro':
        return 'Volumen = π × radio² × altura';
      case 'Esfera':
        return 'Volumen = (4/3) × π × radio³';
      default:
        return '';
    }
  }

  void checkAnswer(double userAnswer) {
    final isCorrect = (userAnswer - state.correctAnswer).abs() < 0.01;
    if (isCorrect) {
      state = state.copyWith(
        message: '¡Correcto! ¡Muy bien!',
        showResult: true,
        selectedAnswer: userAnswer,
      );
    } else {
      state = state.copyWith(
        message:
            'Incorrecto. La respuesta correcta es ${state.correctAnswer.toStringAsFixed(2)}. ¡Inténtalo de nuevo!',
        showResult: true,
        selectedAnswer: userAnswer,
      );
    }
  }
}

final volumeCalculatorProvider =
    StateNotifierProvider<VolumeCalculatorNotifier, VolumeCalculatorState>((
      ref,
    ) {
      final generateQuestionUseCase = GenerateQuestionUseCase();
      final calculateVolumeUseCase = CalculateVolumeUseCase();
      return VolumeCalculatorNotifier(
        generateQuestionUseCase,
        calculateVolumeUseCase,
      );
    });
