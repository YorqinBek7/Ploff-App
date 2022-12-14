import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ploff/data/models/categories/categories.dart';
import 'package:ploff/data/service/api_service.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit()
      : super(const GetCategoriesState(
            categories: [], errorText: '', status: FormzStatus.pure));
  ApiService apiService = ApiService();
  List<int> selectedCategories = [];
  Future<List<Categorie>> getAllCategories() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      List<Categorie> categories = await apiService.getCategories();
      emit(state.copyWith(
          categories: categories, status: FormzStatus.submissionSuccess));
      return categories;
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
      throw Exception(e);
    }
  }
}
