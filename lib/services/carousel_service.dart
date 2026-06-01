import 'dart:convert';
import 'package:aprender_plus_manager/models/carousel_model.dart';
import 'package:flutter/services.dart';

class CarouselService {
  Future<CarouselModel> carregarCarrosel() async {
    final String jsonString = await rootBundle.loadString('assets/json/banco_carrosel.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return CarouselModel.fromMap(jsonData);
  }
}