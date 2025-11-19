import 'package:go_router/go_router.dart';
import 'package:proyecto_infantil/presentation/screens/figures/volume_screen.dart';
import 'package:proyecto_infantil/presentation/screens/operation/operation_basics_screen.dart';
import 'package:proyecto_infantil/routes.dart';

final approuter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/credits', builder: (context, state) => CreditsScreen()),
    GoRoute(
      path: '/operation_basics',
      builder: (context, state) => OperationBasicsScreen(),
    ),

    GoRoute(
      path: '/currency_exchange',
      builder: (context, state) => CurrencyExchangeScreen(),
    ),
    GoRoute(
      path: '/area_geometric_figures',
      builder: (context, state) => AreaGeometricFiguresScreen(),
    ),
    GoRoute(
      path: '/temperature_converter',
      builder: (context, state) => TemperatureConverterScreen(),
    ),
    GoRoute(path: '/distances', builder: (context, state) => DistancesScreen()),
    GoRoute(
      path: '/volume_geometric_figures',
      builder: (context, state) => const VolumeGeometricFiguresScreen(),
    ),
    GoRoute(
      path: '/press_button',
      builder: (context, state) => PressButtonScreen(),
    ),
    GoRoute(
      path: '/colors_buttons',
      builder: (context, state) => ColorsButtonsScreen(),
    ),
  ],
);
