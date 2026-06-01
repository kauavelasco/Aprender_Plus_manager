import 'dart:convert';
import 'package:aprender_plus_manager/models/artigo_model.dart';
import 'package:flutter/services.dart';

class ArtigoService {
  Future<ArtigoModel> carregarDados() async {
    final String jsonString = await rootBundle.loadString('assets/json/banco_artigos.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return ArtigoModel.fromMap(jsonData);
  }
}