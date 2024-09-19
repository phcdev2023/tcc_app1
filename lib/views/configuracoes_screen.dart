import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfiguracoesScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  ConfiguracoesScreen({required this.onThemeChanged, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*SwitchListTile(
              title: Text('Modo Escuro'),
              value: isDarkMode,
              onChanged:
                  onThemeChanged, // Atualiza o tema global // precisa de ajustes
              secondary: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Colors.green[800],
              ),
            ),*/
            ListTile(
              leading: Icon(Icons.school, color: Colors.green[800]),
              title: Text('Dados da Matrícula'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
              onTap: () {
                // Implementar navegação para dados de matrícula
              },
            ),
            ListTile(
              leading:
                  FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green[800]),
              title: Text('Fale com a Secretaria'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
              onTap: () {
                // Implementar lógica para abrir WhatsApp
              },
            ),
          ],
        ),
      ),
    );
  }
}
