import 'package:flutter/material.dart';

class TexfieldData extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final Function? onChanged;

  const TexfieldData(
    this.onChanged, {
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) => onChanged?.call(value),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Exo2',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
