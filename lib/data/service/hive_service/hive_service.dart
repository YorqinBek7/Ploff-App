import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/orders/orders.dart';
import 'package:ploff/data/models/user_locations/user_locations.dart';

class HiveService {
  static final HiveService instance = HiveService._();
  static HiveService get hiveInstance => instance;
  HiveService._();

  late Box<CategWithProduct> cartProductsBox;
  late Box<UserLocations> userLocations;
  late Box<Orders> orderProductsBox;

  Future<void> createBox() async {
    try {
      cartProductsBox = await Hive.openBox<CategWithProduct>("cart_meals");
      userLocations = await Hive.openBox<UserLocations>('user_locations');
      orderProductsBox = await Hive.openBox<Orders>("order_meals");
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteBox() async {
    try {
      cartProductsBox.deleteFromDisk();
    } catch (e) {
      log("Error delete Box");
    }
  }

  Future<void> addProductToStorage(CategWithProduct data) async {
    try {
      cartProductsBox.add(data);
    } catch (e) {
      log("Error adding data to box");
    }
  }

  Future<void> addLocationToStorage(UserLocations data) async {
    try {
      userLocations.add(data);
    } catch (e) {
      log("Error adding data to box");
    }
  }

  Future<void> addProductToOrders(Orders data) async {
    try {
      orderProductsBox.add(data);
    } catch (e) {
      log("Error adding data to box");
    }
  }
}
