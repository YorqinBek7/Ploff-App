import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/user_locations/user_locations.dart';

class HiveService {
  static final HiveService instance = HiveService._();
  static HiveService get hiveInstance => instance;
  HiveService._();

  late Box<CategWithProduct> dataBox;
  late Box<UserLocations> userLocations;

  Future<void> createBox() async {
    try {
      dataBox = await Hive.openBox<CategWithProduct>("cart_meals");
      userLocations = await Hive.openBox<UserLocations>('user_locations');
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

  Future<void> addProductToStorage(CategWithProduct data) async {
    try {
      dataBox.add(data);
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
}
