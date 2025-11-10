import 'package:flutter_riverpod/legacy.dart';
import 'package:proyecto_infantil/config/theme/app_theme.dart';

final selectedColorProvider = StateProvider<int>((ref) => 0);

final colorCardProvider = StateProvider<AppTheme>((ref) {
  return AppTheme(selectedModeCardColor: 6);
});
