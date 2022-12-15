// import 'dart:developer';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:ploff/data/models/products/product.dart';

// class HiveService {
//   static final HiveService instance = HiveService._();
//   static HiveService get hiveInstance => instance;
//   HiveService._();

//   late Box<Product> dataBox;

//   Future<void> createBox() async {
//     try {
//       dataBox = await Hive.openBox("cart_meals");
//     } catch (e) {
//       log("Error Open Box");
//     }
//   }
  

//   Future<void> addData(Product data) async {
//     try {
//       dataBox.putAll(entries);
    
//     } catch (e) {
//       log("Error adding data to box");
      
//     }
//   }
// }
