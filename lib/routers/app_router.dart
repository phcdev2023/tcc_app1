import 'package:flutter/material.dart';
import '../views/cadastro_screen.dart';
import '../views/login_screen.dart';
import '../views/main_screen.dart';

class AppRouter {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  AppRouter({required this.onThemeChanged, required this.isDarkMode});

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/cadastro':
        return MaterialPageRoute(builder: (_) => CadastroScreen());
      case '/home':
        if (args is bool) {
          return MaterialPageRoute(
            builder: (_) => MainScreen(
              isProfessor: args,
              onThemeChanged: onThemeChanged, // Passando o controle de tema
              isDarkMode: isDarkMode, // Passando o estado do tema
            ),
          );
        } else {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
