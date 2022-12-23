import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/count_meals/count_meals_state.dart';

class CountMealsCubit extends Cubit<CountMealsState> {
  CountMealsCubit() : super(InitialState());
  void addMeals() => emit(AddCountState());
  void removeMeals() => emit(RemoveCountState());
  void deleteAllMeals() => emit(DeleteMealsState());
}
