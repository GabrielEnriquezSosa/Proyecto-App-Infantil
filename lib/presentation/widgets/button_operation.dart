import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/presentation/widgets/button.dart';

class ButtonOperation extends ConsumerWidget {
  const ButtonOperation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            buildButton(ref, "+"),
            buildButton(ref, "1"),
            buildButton(ref, "2"),
            buildButton(ref, "3"),
            buildButton(ref, "-"),
          ],
        ),
        Row(
          children: [
            buildButton(ref, "×"),
            buildButton(ref, "4"),
            buildButton(ref, "5"),
            buildButton(ref, "6"),
            buildButton(ref, "÷"),
          ],
        ),
        Row(
          children: [
            buildButton(ref, "C"),
            buildButton(ref, "7"),
            buildButton(ref, "8"),
            buildButton(ref, "9"),
            buildButton(ref, "="),
          ],
        ),
        Row(
          children: [
            buildButton(ref, ""),
            buildButton(ref, ""),
            buildButton(ref, "0"),
            buildButton(ref, ""),
            buildButton(ref, ""),
          ],
        ),
      ],
    );
  }
}
