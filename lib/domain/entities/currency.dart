enum CurrencyType { dolar, euro, yen, libra, pesos }

class Currency {
  final double value;
  final CurrencyType from;
  final CurrencyType to;

  Currency({required this.value, required this.from, required this.to});

  double get convertedValue {
    const Map<CurrencyType, double> rates = {
      CurrencyType.dolar: 1.0,
      CurrencyType.euro: 0.92,
      CurrencyType.yen: 157.28,
      CurrencyType.libra: 0.79,
      CurrencyType.pesos: 18.3,
    };

    final double valueInUsd = value / rates[from]!;
    return valueInUsd * rates[to]!;
  }
}
