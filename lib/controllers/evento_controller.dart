import '../models/evento.dart';
import '../repositories/database_helper.dart';

class EventoController {
  Future<List<Evento>> obterEventos() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('eventos');
    return List.generate(maps.length, (i) {
      return Evento.fromMap(maps[i]);
    });
  }

  Future<void> criarEvento(Evento evento) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('eventos', evento.toMap());
  }
}
