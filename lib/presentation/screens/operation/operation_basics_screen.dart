import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/presentation/providers/calculator_provider.dart';
import 'package:proyecto_infantil/presentation/widgets/button_operation.dart';

class OperationBasicsScreen extends ConsumerWidget {
  const OperationBasicsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Operaciones Basicas"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(54, 237, 233, 0),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 237, 233, 0)),
            child: SizedBox.expand(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/img/children.png', height: 230),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 170,
                width: 300,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/display.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 8,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      state.output,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ButtonOperation(),
            ],
          ),
        ],
      ),
    );
  }
}
