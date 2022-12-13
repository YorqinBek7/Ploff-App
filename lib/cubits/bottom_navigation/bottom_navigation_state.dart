part of 'bottom_navigation_cubit.dart';

@immutable
abstract class BottomNavigationState {}

class BottomNavigationInHome extends BottomNavigationState {}

class BottomNavigationInCart extends BottomNavigationState {
  BottomNavigationInCart();
}

class BottomNavigationInMyOrders extends BottomNavigationState {}

class BottomNavigationInProfile extends BottomNavigationState {}
