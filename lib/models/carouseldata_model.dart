class CarouseldataModel {
  final String titulo;

  CarouseldataModel({
    required this.titulo
  });

  factory CarouseldataModel.fromMap(
    Map<String, dynamic> map
  ) {
    return CarouseldataModel(
      titulo: map['titulo'] ?? ''
    );
  }
}