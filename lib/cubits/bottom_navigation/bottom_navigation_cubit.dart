import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);
  Box<CategWithProduct> savedMeals = HiveService.instance.cartProductsBox;
  int sum = 0;
  void changeBottomNavigationPages(int index) {
    if (index == 1) getAllOrderPrice();
    emit(index);
  }

  void getAllOrderPrice() {
    sum = 0;
    for (var i = 0; i < savedMeals.length; i++) {
      sum += savedMeals.getAt(i)?.outPrice ?? 0;
    }
  }
}
