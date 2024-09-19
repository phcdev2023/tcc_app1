import '../models/aluno.dart';
import '../models/coordenador.dart';
import '../models/professor.dart';
import '../repositories/database_helper.dart';

class UsuarioController {
  Future<Aluno?> obterAlunoPorEmail(String email) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result =
        await db.query('alunos', where: 'email = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      return Aluno.fromMap(result.first);
    }
    return null;
  }

  Future<Professor?> obterProfessorPorEmail(String email) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result =
        await db.query('professores', where: 'email = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      return Professor.fromMap(result.first);
    }
    return null;
  }

  Future<Coordenador?> obterCoordenadorPorEmail(String email) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result =
        await db.query('coordenadores', where: 'email = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      return Coordenador.fromMap(result.first);
    }
    return null;
  }
}
