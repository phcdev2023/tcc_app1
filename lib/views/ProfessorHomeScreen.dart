import 'package:flutter/material.dart';

class ProfessorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área do Professor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo, Professor!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicionar eventos no calendário
              },
              child: Text('Adicionar Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
