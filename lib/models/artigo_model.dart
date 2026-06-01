import 'package:aprender_plus_manager/models/artigodata_model.dart';

class ArtigoModel {
  final List<ArtigodataModel> artigos;

  ArtigoModel({
    required this.artigos
  });

  factory ArtigoModel.fromMap(
    Map<String, dynamic> map
  ) {
    return ArtigoModel(
      artigos: (map['artigos'] as List)
        .map((e) => ArtigodataModel.fromMap(e)).toList()
    );
  }
}