part of 'bottom_navigation_cubit.dart';

@immutable
abstract class BottomNavigationState {}

class BottomNavigationInHome extends BottomNavigationState {}

class BottomNavigationInCart extends BottomNavigationState {
  List<CachedMeals> meals;
  BottomNavigationInCart({required this.meals});
}

class BottomNavigationInMyOrders extends BottomNavigationState {}

class BottomNavigationInProfile extends BottomNavigationState {}
