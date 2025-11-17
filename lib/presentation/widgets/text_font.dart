import 'package:flutter/material.dart';

class TextFont extends StatelessWidget {
  final String text;
  const TextFont({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Exo2',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
