import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/data/models/products/product.dart';

class HiveService {
  static final HiveService instance = HiveService._();
  static HiveService get hiveInstance => instance;
  HiveService._();

  late Box<Products> dataBox;

  Future<void> createBox() async {
    try {
      dataBox = await Hive.openBox<Products>("cart_meals");
    } catch (e) {
      log("Error Open Box");
    }
  }

  Future<void> deleteBox() async {
    try {
      dataBox.deleteFromDisk();
    } catch (e) {
      log("Error delete Box");
    }
  }

  Future<void> addData(Products data) async {
    try {
      dataBox
          .add(data)
          .then((value) => log(dataBox.getAt(0)!.currency.toString()));
    } catch (e) {
      log("Error adding data to box");
    }
  }
}
