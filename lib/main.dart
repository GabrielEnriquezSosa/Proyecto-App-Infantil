import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_infantil/config/router/app_router.dart';
import 'package:proyecto_infantil/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_infantil/data/repositories/calculator_repository_impl.dart';
import 'package:proyecto_infantil/data/repositories/currency_repository_impl.dart';
import 'package:proyecto_infantil/domain/usecases/calculate_operation.dart';
import 'package:proyecto_infantil/domain/usecases/convert_currency.dart';
import 'package:proyecto_infantil/presentation/providers/Splash/splash_provider.dart';
import 'package:proyecto_infantil/presentation/providers/calculator_provider.dart';
import 'package:proyecto_infantil/presentation/providers/currency_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final calculatorRepository = CalculatorRepositoryImpl();
  final calculateUseCase = CalculateOperation(calculatorRepository);

  final currencyRepository = CurrencyRepositoryImpl();
  final currencyUseCase = ConvertCurrency(currencyRepository);

  runApp(
    ProviderScope(
      overrides: [
        calculatorProvider.overrideWith((ref) => CalculatorNotifier(calculateUseCase)),
        currencyNotifierProvider.overrideWith((ref) => CurrencyNotifier(currencyUseCase)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(selectedColorProvider);

    return MaterialApp.router(
      routerConfig: approuter,
      theme: AppTheme(selectedColor: selectedColor).getTheme(),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
    );
  }
}
