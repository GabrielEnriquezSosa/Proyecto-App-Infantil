import 'package:flutter_riverpod/legacy.dart';
import 'package:proyecto_infantil/domain/entities/operation.dart';
import 'package:proyecto_infantil/domain/usecases/calculate_operation.dart';

class CalculatorState {
  final String output;
  final String input;
  final double? num1;
  final String? operator;

  CalculatorState({
    this.output = "0",
    this.input = "",
    this.num1,
    this.operator,
  });

  CalculatorState copyWith({
    String? output,
    String? input,
    double? num1,
    String? operator,
  }) {
    return CalculatorState(
      output: output ?? this.output,
      input: input ?? this.input,
      num1: num1 ?? this.num1,
      operator: operator ?? this.operator,
    );
  }
}

class CalculatorNotifier extends StateNotifier<CalculatorState> {
  final CalculateOperation calculateOperation;

  CalculatorNotifier(this.calculateOperation) : super(CalculatorState());

  void press(String value) {
    if (value == "C") {
      state = CalculatorState();
    } else if (["+", "-", "×", "÷"].contains(value)) {
      state = state.copyWith(
        num1: double.tryParse(state.input),
        operator: value,
        input: "",
      );
    } else if (value == "=") {
      final num2 = double.tryParse(state.input) ?? 0;
      if (state.num1 != null && state.operator != null) {
        try {
          final result = calculateOperation(
            Operation(num1: state.num1!, num2: num2, operator: state.operator!),
          );
          state = CalculatorState(
            output: result.toString(),
            input: result.toString(),
          );
        } catch (e) {
          state = state.copyWith(output: "Error");
        }
      }
    } else {
      final newInput = state.input + value;
      state = state.copyWith(input: newInput, output: newInput);
    }
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorState>((ref) {
      throw UnimplementedError("Debe inicializarse en main.dart");
    });
