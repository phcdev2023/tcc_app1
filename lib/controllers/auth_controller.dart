import '../models/aluno.dart';
import '../repositories/database_helper.dart';

class AuthController {
  Future<bool> validarCadastro(String email) async {
    final db = await DatabaseHelper.instance.database;
    final result =
        await db.query('alunos', where: 'email = ?', whereArgs: [email]);
    return result.isNotEmpty;
  }

  Future<void> cadastrarAluno(Aluno aluno) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('alunos', aluno.toMap());
  }
}
