/*import 'package:flutter/material.dart';

import '../controllers/nota_controller.dart';
import '../models/nota.dart';

class LancarNotasScreen extends StatelessWidget {
  final NotaController _notaController = NotaController();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final int idAluno; // O ID do aluno que receberá a nota

  LancarNotasScreen({required this.idAluno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lançar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _valorController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Nota novaNota = Nota(
                  titulo: _tituloController.text,
                  valor: double.parse(_valorController.text),
                  idAluno: idAluno,
                );
                await _notaController.criarNota(novaNota);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Nota lançada com sucesso')),
                );
                Navigator.pop(context);
              },
              child: Text('Lançar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
