import 'package:flutter/material.dart';

class AlunoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área do Aluno'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo, Aluno!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // fazer eventos
              },
              child: Text('Visualizar Eventos'),
            ),
          ],
        ),
      ),
    );
  }
}
