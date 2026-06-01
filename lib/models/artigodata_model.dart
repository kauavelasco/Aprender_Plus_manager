class ArtigodataModel {
  final String titulo;
  final String descricao;
  final String data;

  ArtigodataModel({
    required this.titulo,
    required this.descricao,
    required this.data
  });

  factory ArtigodataModel.fromMap(
    Map<String, dynamic> map
  ) {
    return ArtigodataModel(
      titulo: map['titulo'] ?? '', 
      descricao: map['descricao'] ?? '', 
      data: map['data'] ?? ''
    );
  }
}