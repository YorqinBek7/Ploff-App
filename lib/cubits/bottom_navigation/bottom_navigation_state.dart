part of 'bottom_navigation_cubit.dart';

@immutable
abstract class BottomNavigationState {
  BottomNavigationState({required this.index});
  int index;
}

class BottomNavigationInHome extends BottomNavigationState {
  BottomNavigationInHome({required super.index});
}

class BottomNavigationInCart extends BottomNavigationState {
  BottomNavigationInCart({required super.index});
}

class BottomNavigationInMyOrders extends BottomNavigationState {
  BottomNavigationInMyOrders({required super.index});
}

class BottomNavigationInProfile extends BottomNavigationState {
  BottomNavigationInProfile({required super.index});
}
