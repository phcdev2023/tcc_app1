import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routers/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
    _appRouter =
        AppRouter(onThemeChanged: _toggleTheme, isDarkMode: _isDarkMode);
  }

  // Carrega preferência de tema
  void _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _appRouter =
          AppRouter(onThemeChanged: _toggleTheme, isDarkMode: _isDarkMode);
    });
  }

  // Alterna tema e salvar preferência
  void _toggleTheme(bool isDark) async {
    setState(() {
      _isDarkMode = isDark;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faculdade App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      initialRoute: '/',
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}
