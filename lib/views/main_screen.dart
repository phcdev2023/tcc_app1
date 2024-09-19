import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'disciplinas_screen.dart';
import 'notas_screen.dart';
import 'perfil_screen.dart';

class MainScreen extends StatefulWidget {
  final bool isProfessor;
  final Function(bool) onThemeChanged; // Função para alterar o tema
  final bool isDarkMode; // Estado do tema

  MainScreen({
    required this.isProfessor,
    required this.onThemeChanged, // Recebe a função de mudança de tema
    required this.isDarkMode, // Recebe o estado do tema
  });

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    // Inicializar as telas com a permissão de professor/aluno e tema
    _screens = [
      HomeScreen(isProfessor: widget.isProfessor),
      DisciplinasScreen(isProfessor: widget.isProfessor),
      NotasScreen(isProfessor: widget.isProfessor),
      PerfilScreen(
        isDarkMode: widget.isDarkMode, // Passando estado de tema
        isProfessor: widget.isProfessor, // Passando o tipo de usuário
        onThemeChanged: widget.onThemeChanged, // Passando a função de tema
      ),
    ];
  }

  final List<String> _titles = [
    'Calendário',
    'Disciplinas',
    'Notas',
    'Perfil',
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

// App bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Disciplinas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.green[800],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
