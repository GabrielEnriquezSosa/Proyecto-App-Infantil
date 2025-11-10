import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final Color color;
  final String colors;
  final String? text;

  const ButtonCircle({
    super.key,
    required this.color,
    this.text,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Color Seleccionado',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                'El Color Seleccionado es: $colors',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      style: FilledButton.styleFrom(backgroundColor: color),
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Align(alignment: Alignment.center, child: Container()),
      ),
    );
  }
}
