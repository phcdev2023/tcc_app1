class Aluno {
  final int? id;
  final String nome;
  final String email;
  final String numeroInscricao;
  final String curso;

  Aluno({
    this.id,
    required this.nome,
    required this.email,
    required this.numeroInscricao,
    required this.curso,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'numeroInscricao': numeroInscricao,
      'curso': curso,
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      numeroInscricao: map['numeroInscricao'],
      curso: map['curso'],
    );
  }
}
