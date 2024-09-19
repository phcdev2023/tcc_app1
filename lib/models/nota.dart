class Nota {
  final int? id;
  final String titulo;
  final double valor;
  final int idAluno;

  Nota({
    this.id,
    required this.titulo,
    required this.valor,
    required this.idAluno,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'valor': valor,
      'idAluno': idAluno,
    };
  }

  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      id: map['id'],
      titulo: map['titulo'],
      valor: map['valor'],
      idAluno: map['idAluno'],
    );
  }
}
