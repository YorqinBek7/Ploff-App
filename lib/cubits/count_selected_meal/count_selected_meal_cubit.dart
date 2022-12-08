import 'package:flutter_bloc/flutter_bloc.dart';

class CountSelectedMealCubit extends Cubit<int> {
  CountSelectedMealCubit() : super(1);

  void addCountMeal() {
    emit(state + 1);
  }

  void removeCountMeal() {
    emit(state - 1);
  }
}
