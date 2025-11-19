import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/presentation/providers/volume_calculator_provider.dart';
import 'package:proyecto_infantil/presentation/widgets/shape_painter.dart';
import 'package:proyecto_infantil/presentation/widgets/texfield_data.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class VolumeGeometricFiguresScreen extends ConsumerWidget {
  const VolumeGeometricFiguresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(volumeCalculatorProvider);
    final notifier = ref.read(volumeCalculatorProvider.notifier);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/figures_img/fondo.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Calcular el Volumen',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.brown,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/figures_img/Capymat-volumen.png',
                  height: 150,
                ),
                const SizedBox(height: 20),
                _buildFigureSelector(context, ref),
                const SizedBox(height: 10),
                Text(
                  'Calcula el volumen de un ${state.selectedFigure} con:',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                _buildProblemDisplay(context, state),
                const SizedBox(height: 10),
                Text(
                  state.formula,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      state.answers.map((answer) {
                        Color? buttonColor;
                        if (state.showResult) {
                          final isCorrect =
                              (state.correctAnswer - answer).abs() < 0.01;
                          buttonColor = isCorrect ? Colors.green : Colors.grey;
                        }

                        return ElevatedButton(
                          onPressed:
                              state.showResult
                                  ? null
                                  : () => notifier.checkAnswer(answer),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                          ),
                          child: Text(
                            answer.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo2',
                            ),
                          ),
                        );
                      }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: notifier.generateNewQuestion,
                      child: const Text(
                        'Nueva Pregunta',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo2',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (state.showResult) _buildResultMessage(context, state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFigureSelector(BuildContext context, WidgetRef ref) {
    final state = ref.watch(volumeCalculatorProvider);
    final notifier = ref.read(volumeCalculatorProvider.notifier);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        value: state.selectedFigure,
        items:
            state.figures.map((String figure) {
              return DropdownMenuItem<String>(
                value: figure,
                child: Text(figure),
              );
            }).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            notifier.setSelectedFigure(newValue);
          }
        },
        decoration: const InputDecoration(
          labelText: 'Elige una figura',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildProblemDisplay(
    BuildContext context,
    VolumeCalculatorState state,
  ) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: ShapePainter(
              figure: state.selectedFigure,
              color: Colors.orange.shade100,
            ),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                ...state.params.entries.map((entry) {
                  return Text(
                    '${entry.key.capitalize()} = ${entry.value}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultMessage(
    BuildContext context,
    VolumeCalculatorState state,
  ) {
    bool isCorrect = state.message.startsWith('Correcto!');
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        state.message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
        ),
      ),
    );
  }
}
