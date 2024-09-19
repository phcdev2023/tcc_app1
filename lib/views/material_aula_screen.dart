import 'package:flutter/material.dart';

class MaterialAulaScreen extends StatelessWidget {
  final String disciplina;

  MaterialAulaScreen({required this.disciplina});

  @override // Tela de materiais
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materiais - $disciplina'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Materiais Disponíveis',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildMaterialCard('Aula 1 - Introdução', 'introducao.pdf'),
                  _buildMaterialCard('Aula 2 - Fundamentos', 'fundamentos.pdf'),
                  _buildMaterialCard('Aula 3 - Aplicações', 'aplicacoes.pdf'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialCard(String title, String fileName) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: Icon(Icons.picture_as_pdf, color: Colors.red),
        title: Text(title),
        trailing: Icon(Icons.download, color: Colors.green[800]),
        onTap: () {
          // Lógica para baixar o arquivo PDF
          print('Baixando $fileName');
        },
      ),
    );
  }
}
