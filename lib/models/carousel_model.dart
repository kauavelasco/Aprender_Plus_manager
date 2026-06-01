import 'package:aprender_plus_manager/models/carouseldata_model.dart';

class CarouselModel {
  final List<CarouseldataModel> carrosel;

  CarouselModel({
    required this.carrosel
  });

  factory CarouselModel.fromMap(
    Map<String, dynamic> map
  ) {
    return CarouselModel(
      carrosel: (map['carrosel'] as List)
        .map((e) => CarouseldataModel.fromMap(e)).toList()
    );
  }
}