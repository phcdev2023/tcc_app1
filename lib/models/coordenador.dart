class Coordenador {
  final int? id;
  final String nome;
  final String email;
  final String numeroInscricao;

  Coordenador({
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

  factory Coordenador.fromMap(Map<String, dynamic> map) {
    return Coordenador(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      numeroInscricao: map['numeroInscricao'],
    );
  }
}
