import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/data/local_database/cached_meals.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInHome());
  List<CachedMeals> meals = [];
  void changeBottomNavigationPages(int index, List<CachedMeals> meals) {
    if (index == 0) {
      emit(BottomNavigationInHome());
    } else if (index == 1) {
      emit(BottomNavigationInCart(meals: meals));
    } else if (index == 2) {
      emit(BottomNavigationInMyOrders());
    } else if (index == 3) {
      emit(BottomNavigationInProfile());
    }
  }
}
