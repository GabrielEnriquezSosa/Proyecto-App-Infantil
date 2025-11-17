import 'package:proyecto_infantil/domain/entities/currency.dart';

abstract class CurrencyRepository {
  Future<double> convertCurrency(double value, CurrencyType from, CurrencyType to);
}
