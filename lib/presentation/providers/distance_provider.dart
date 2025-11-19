import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:proyecto_infantil/domain/entities/distance.dart';

class DistanceState {
  final DistanceType from;
  final DistanceType to;
  final double amount;
  final double convertedValue;
  final bool isLoading;

  DistanceState({
    this.from = DistanceType.metros,
    this.to = DistanceType.kilometros,
    this.amount = 0.0,
    this.convertedValue = 0.0,
    this.isLoading = false,
  });

  DistanceState copyWith({
    DistanceType? from,
    DistanceType? to,
    double? amount,
    double? convertedValue,
    bool? isLoading,
  }) {
    return DistanceState(
      from: from ?? this.from,
      to: to ?? this.to,
      amount: amount ?? this.amount,
      convertedValue: convertedValue ?? this.convertedValue,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class DistanceNotifier extends StateNotifier<DistanceState> {
  DistanceNotifier() : super(DistanceState());

  void setFromDistance(DistanceType from) {
    state = state.copyWith(from: from);
  }

  void setToDistance(DistanceType to) {
    state = state.copyWith(to: to);
  }

  void setAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  void convert() {
    state = state.copyWith(isLoading: true);
    final double convertedValue = _convert(state.from, state.to, state.amount);
    state = state.copyWith(convertedValue: convertedValue, isLoading: false);
  }

  double _convert(DistanceType from, DistanceType to, double amount) {
    double valueInMeters;

    // Convert input to meters
    switch (from) {
      case DistanceType.kilometros:
        valueInMeters = amount * 1000;
        break;
      case DistanceType.metros:
        valueInMeters = amount;
        break;
      case DistanceType.centimetros:
        valueInMeters = amount / 100;
        break;
      case DistanceType.milimetros:
        valueInMeters = amount / 1000;
        break;
      case DistanceType.pulgadas:
        valueInMeters = amount * 0.0254;
        break;
      case DistanceType.pies:
        valueInMeters = amount * 0.3048;
        break;
    }

    // Convert from meters to target unit
    switch (to) {
      case DistanceType.kilometros:
        return valueInMeters / 1000;
      case DistanceType.metros:
        return valueInMeters;
      case DistanceType.centimetros:
        return valueInMeters * 100;
      case DistanceType.milimetros:
        return valueInMeters * 1000;
      case DistanceType.pulgadas:
        return valueInMeters / 0.0254;
      case DistanceType.pies:
        return valueInMeters / 0.3048;
    }
  }
}

final distanceNotifierProvider =
    StateNotifierProvider<DistanceNotifier, DistanceState>((ref) {
      return DistanceNotifier();
    });
