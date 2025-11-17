import 'package:flutter/material.dart';

class TexfieldData extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final Function onChanged;

  const TexfieldData({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) => onChanged(),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      style: TextStyle(
        fontSize: 10,
        fontFamily: 'Exo2',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
