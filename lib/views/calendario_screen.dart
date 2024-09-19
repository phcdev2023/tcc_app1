import 'package:flutter/material.dart';

import '../controllers/evento_controller.dart';
import '../models/evento.dart';

class CalendarioScreen extends StatelessWidget {
  final EventoController _eventoController = EventoController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Evento>>(
      future: _eventoController.obterEventos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar eventos'));
        } else {
          final eventos = snapshot.data ?? [];
          return ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              final evento = eventos[index];
              return ListTile(
                title: Text(evento.titulo),
                subtitle: Text(evento.descricao),
                trailing: Text(evento.data.toString()),
              );
            },
          );
        }
      },
    );
  }
}
