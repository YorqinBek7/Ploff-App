import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInHome());

  void changeBottomNavigationPages(int index) {
    if (index == 0) {
      emit(BottomNavigationInHome());
    } else if (index == 1) {
      emit(BottomNavigationInCart());
    } else if (index == 2) {
      emit(BottomNavigationInMyOrders());
    } else if (index == 3) {
      emit(BottomNavigationInProfile());
    }
  }
}
