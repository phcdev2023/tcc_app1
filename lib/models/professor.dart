class Professor {
  final int? id;
  final String nome;
  final String email;
  final String numeroInscricao;

  Professor({
    this.id,
    required this.nome,
    required this.email,
    required this.numeroInscricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'numeroInscricao': numeroInscricao,
    };
  }

  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      numeroInscricao: map['numeroInscricao'],
    );
  }
}
