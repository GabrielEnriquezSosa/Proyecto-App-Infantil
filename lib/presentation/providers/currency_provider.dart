import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:proyecto_infantil/domain/entities/currency.dart';
import 'package:proyecto_infantil/domain/usecases/convert_currency.dart';
import 'package:proyecto_infantil/data/repositories/currency_repository_impl.dart';

class CurrencyState {
  final double value;
  final CurrencyType from;
  final CurrencyType to;
  final double convertedValue;
  final bool isLoading;

  CurrencyState({
    this.value = 0.0,
    this.from = CurrencyType.dolar,
    this.to = CurrencyType.pesos,
    this.convertedValue = 0.0,
    this.isLoading = false,
  });

  CurrencyState copyWith({
    double? value,
    CurrencyType? from,
    CurrencyType? to,
    double? convertedValue,
    bool? isLoading,
  }) {
    return CurrencyState(
      value: value ?? this.value,
      from: from ?? this.from,
      to: to ?? this.to,
      convertedValue: convertedValue ?? this.convertedValue,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CurrencyNotifier extends StateNotifier<CurrencyState> {
  final ConvertCurrency convertCurrencyUseCase;

  CurrencyNotifier(this.convertCurrencyUseCase) : super(CurrencyState());

  void setAmount(double value) {
    state = state.copyWith(value: value);
  }

  void setFromCurrency(CurrencyType from) {
    state = state.copyWith(from: from);
  }

  void setToCurrency(CurrencyType to) {
    state = state.copyWith(to: to);
  }

  Future<void> convert() async {
    state = state.copyWith(isLoading: true);
    final result = await convertCurrencyUseCase.execute(
      state.value,
      state.from,
      state.to,
    );
    state = state.copyWith(convertedValue: result, isLoading: false);
  }
}

final currencyRepositoryProvider = Provider((ref) => CurrencyRepositoryImpl());

final convertCurrencyProvider = Provider((ref) {
  final repository = ref.watch(currencyRepositoryProvider);
  return ConvertCurrency(repository);
});

final currencyNotifierProvider =
    StateNotifierProvider<CurrencyNotifier, CurrencyState>((ref) {
      final convertCurrency = ref.watch(convertCurrencyProvider);
      return CurrencyNotifier(convertCurrency);
    });
