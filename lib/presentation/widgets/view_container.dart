import 'package:flutter/material.dart';

class ViewContainer extends StatelessWidget {
  final String text;

  const ViewContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Exo2',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}