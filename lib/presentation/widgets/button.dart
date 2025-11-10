import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/presentation/providers/calculator_provider.dart';

Widget buildButton(WidgetRef ref, String value) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/$value.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: FilledButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(120, 120),
          padding: const EdgeInsets.all(25),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        ),
        onPressed: () => ref.read(calculatorProvider.notifier).press(value),
        child: null,
      ),
    ),
  );
}
