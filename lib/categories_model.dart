import 'package:flutter/cupertino.dart';

class CategoriesModel {
  final String name;
  final Color color;
  final String image;

  CategoriesModel({
    required this.name,
    required this.color,
    required this.image,
  });
}

List<CategoriesModel> categories = [
  CategoriesModel(
    name: "Apartment",
    color: Color(0xFFFFFFFF),
    image: "assets/apartment.jpg",
  ),
  CategoriesModel(
    name: "House",
    color: Color(0xFFFFFFFF),
    image: "assets/house.jpg",
  ),
  CategoriesModel(
    name: "Office",
    color: Color(0xFFFFFFFF),
    image: "assets/office.jpg",
  ),
];
