import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color? color;
  final String? description;
  final String? imageUrl;

  const CategoryModel(
      {required this.id,
      required this.title,
      this.description,
      this.color,
      this.imageUrl});
}
