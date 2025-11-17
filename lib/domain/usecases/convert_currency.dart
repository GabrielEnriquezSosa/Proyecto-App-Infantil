import 'package:proyecto_infantil/domain/entities/currency.dart';
import 'package:proyecto_infantil/domain/repositories/currency_repository.dart';

class ConvertCurrency {
  final CurrencyRepository repository;

  ConvertCurrency(this.repository);

  Future<double> execute(double value, CurrencyType from, CurrencyType to) {
    return repository.convertCurrency(value, from, to);
  }
}
