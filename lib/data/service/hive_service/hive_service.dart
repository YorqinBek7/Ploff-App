import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/category_with_products/categ_with_product.dart';

class HiveService {
  static final HiveService instance = HiveService._();
  static HiveService get hiveInstance => instance;
  HiveService._();

  late Box<CategWithProduct> dataBox;

  Future<void> createBox() async {
    try {
      dataBox = await Hive.openBox<CategWithProduct>("cart_meals");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteBox() async {
    try {
      dataBox.deleteFromDisk();
    } catch (e) {
      log("Error delete Box");
    }
  }

  Future<void> addData(CategWithProduct data) async {
    try {
      dataBox.add(data);
    } catch (e) {
      log("Error adding data to box");
    }
  }
}
