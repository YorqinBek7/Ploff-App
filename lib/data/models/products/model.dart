import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ploff/data/models/products/product.dart';

class MealsModel {
  final List<Product> products;
  final String count;
  MealsModel({
    required this.products,
    required this.count,
  });

  MealsModel copyWith({
    List<Product>? products,
    String? count,
  }) {
    return MealsModel(
      products: products ?? this.products,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'count': count,
    };
  }

  factory MealsModel.fromMap(Map<String, dynamic> map) {
    return MealsModel(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      count: map['count'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealsModel.fromJson(String source) =>
      MealsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MealsModel(products: $products, count: $count)';

  @override
  bool operator ==(covariant MealsModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.products, products) && other.count == count;
  }

  @override
  int get hashCode => products.hashCode ^ count.hashCode;
}
