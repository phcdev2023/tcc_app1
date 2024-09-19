class Evento {
  final int? id;
  final String titulo;
  final String descricao;
  final DateTime data;
  final int idProfessor; // Ou idCoordenador, conforme sua lógica

  Evento({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.idProfessor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data': data.toIso8601String(),
      'idProfessor': idProfessor,
    };
  }

  factory Evento.fromMap(Map<String, dynamic> map) {
    return Evento(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      data: DateTime.parse(map['data']),
      idProfessor: map['idProfessor'],
    );
  }
}
