import 'package:proyecto_infantil/domain/entities/currency.dart';
import 'package:proyecto_infantil/domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  @override
  Future<double> convertCurrency(
    double value,
    CurrencyType from,
    CurrencyType to,
  ) async {
    // Conversion rates relative to USD
    const Map<CurrencyType, double> rates = {
      CurrencyType.dolar: 1.0,
      CurrencyType.euro: 0.92,
      CurrencyType.yen: 157.28,
      CurrencyType.libra: 0.79,
      CurrencyType.pesos: 18.3,
    };

    final double valueInUsd = value / rates[from]!;
    final double convertedValue = valueInUsd * rates[to]!;

    return convertedValue;
  }
}
