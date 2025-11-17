import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/domain/entities/currency.dart';
import 'package:proyecto_infantil/presentation/providers/currency_provider.dart';
import 'package:proyecto_infantil/presentation/widgets/view_container.dart';

class CurrencyExchangeScreen extends ConsumerWidget {
  const CurrencyExchangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyState = ref.watch(currencyNotifierProvider);
    final currencyNotifier = ref.read(currencyNotifierProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/curency_img/fondo.png"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Conversor de Monedas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 40,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/img/curency_img/Capymat-moneda.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '¿Qué Moneda quieres convertir?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Flexible(
                    child: _buildCurrencyDropdown(
                      currencyState.from,
                      currencyNotifier.setFromCurrency,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'a',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: _buildCurrencyDropdown(
                      currencyState.to,
                      currencyNotifier.setToCurrency,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '¿Cuánto quieres convertir?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Monto',
                    labelStyle: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onChanged: (value) {
                    currencyNotifier.setAmount(double.tryParse(value) ?? 0.0);
                  },
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: GestureDetector(
                  child: Image.asset(
                    "assets/img/curency_img/Capymat-convertir.png",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    currencyNotifier.convert();
                  },
                ),
              ),

              const SizedBox(height: 10),
              if (currencyState.isLoading)
                const CircularProgressIndicator()
              else
                Flexible(
                  child: ViewContainer(
                    text:
                        'Resultado: ${currencyState.convertedValue.toStringAsFixed(2)}',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown(
    CurrencyType value,
    void Function(CurrencyType) onChanged,
  ) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton<CurrencyType>(
            value: value,
            isExpanded: true,
            items:
                CurrencyType.values.map((CurrencyType currency) {
                  return DropdownMenuItem<CurrencyType>(
                    value: currency,
                    child: Text(currency.name.toUpperCase()),
                  );
                }).toList(),
            onChanged: (CurrencyType? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            underline: Container(),
          ),
        ),
      ),
    );
  }
}
