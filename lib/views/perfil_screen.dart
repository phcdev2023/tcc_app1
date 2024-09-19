import 'package:flutter/material.dart';

import 'configuracoes_screen.dart';

class PerfilScreen extends StatelessWidget {
  final bool isDarkMode;
  final bool isProfessor;
  final Function(bool) onThemeChanged;

  PerfilScreen({
    required this.isDarkMode,
    required this.isProfessor,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
                'assets/imagens/coruja.png'), // Exemplo de imagem de perfil
          ),
          SizedBox(height: 16),
          Text(
            'Nome do Usuário',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Curso: Ciência da Computação',
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
          SizedBox(height: 16),
          Divider(),
          // Comentado botao modo escuro para resolver depois
          /*
          SwitchListTile(
            title: Text("Modo escuro"),
            value: isDarkMode,
            onChanged: onThemeChanged,
            activeColor: Colors.green[800],
          ),
          */
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green[800]),
            title: Text('Configurações'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
            onTap: () {
              _navigateToSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Sair'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
            onTap: () {
              _confirmLogout(context);
            },
          ),
        ],
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfiguracoesScreen(
          onThemeChanged: onThemeChanged,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deseja realmente sair?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 75, 75, 75))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    child: Text('Sair'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
