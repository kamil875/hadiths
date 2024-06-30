import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/themes/app_theme.dart';
import '../state/settings_state.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsState>(context);
    return MaterialApp(
      themeMode: getTheme(settings.getThemeIndex),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGeneratorRoute,
      home: const MainPage(),
    );
  }

  ThemeMode getTheme(int themeIndex) {
    late ThemeMode themeMode;
    switch (themeIndex) {
      case 1:
        themeMode = ThemeMode.light;
        break;
      case 2:
        themeMode = ThemeMode.dark;
        break;
      case 3:
        themeMode = ThemeMode.system;
        break;
    }
    return themeMode;
  }
}
