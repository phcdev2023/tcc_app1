import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "app_database.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alunos (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        numeroInscricao TEXT NOT NULL,
        curso TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE professores (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        numeroInscricao TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE coordenadores (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        numeroInscricao TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE eventos (
        id INTEGER PRIMARY KEY,
        titulo TEXT NOT NULL,
        descricao TEXT NOT NULL,
        data TEXT NOT NULL,
        idProfessor INTEGER,
        FOREIGN KEY (idProfessor) REFERENCES professores (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE notas (
        id INTEGER PRIMARY KEY,
        titulo TEXT NOT NULL,
        valor REAL NOT NULL,
        idAluno INTEGER,
        FOREIGN KEY (idAluno) REFERENCES alunos (id)
      )
    ''');
  }
}
