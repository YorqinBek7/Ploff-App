import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInHome(index: 0));

  void changeBottomNavigationPages(int index) {
    if (index == 0) {
      emit(BottomNavigationInHome(index: 0));
    } else if (index == 1) {
      emit(BottomNavigationInCart(index: 1));
    } else if (index == 2) {
      emit(BottomNavigationInMyOrders(index: 2));
    } else if (index == 3) {
      emit(BottomNavigationInProfile(index: 3));
    }
  }
}
