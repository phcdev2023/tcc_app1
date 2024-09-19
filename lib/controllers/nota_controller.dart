import '../models/nota.dart';
import '../repositories/database_helper.dart';

class NotaController {
  Future<List<Nota>> obterNotas(int idAluno) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notas',
      where: 'idAluno = ?',
      whereArgs: [idAluno],
    );
    return List.generate(maps.length, (i) {
      return Nota.fromMap(maps[i]);
    });
  }

  Future<void> criarNota(Nota nota) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('notas', nota.toMap());
  }
}
