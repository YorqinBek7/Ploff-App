import 'package:hive/hive.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';

part 'orders.g.dart';

@HiveType(typeId: 5)
class Orders {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String time;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String paymentType;

  @HiveField(4)
  final List<CategWithProduct> orderedProducts;

  Orders({
    required this.orderedProducts,
    required this.address,
    required this.date,
    required this.paymentType,
    required this.time,
  });
}
