import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:ploff/data/models/banners/banners.dart';
import 'package:ploff/data/models/categories/categories.dart';
import 'package:ploff/data/models/products/product.dart';

import 'package:ploff/data/service/api_service/api_service.dart';

part 'get_product_and_category_state.dart';

enum HomeScreenStates {
  searchState,
  initialState,
}

class GetProductAndCategoryCubit extends Cubit<GetProductAndCategoryState> {
  List<int> selectedCategories = [];
  GetProductAndCategoryCubit()
      : super(
          const GetProductAndCategoryState(
            errorText: '',
            products: [],
            status: FormzStatus.pure,
            categories: [],
            banners: [],
            states: HomeScreenStates.initialState,
          ),
        );
  List<Categories> categories = [];
  ApiService apiService = ApiService();
  Future<void> getProductAndCateg({String? searchText}) async {
    try {
      if (searchText != null) {
        emit(state.copyWith(states: HomeScreenStates.searchState));
      }
      if (searchText?.isEmpty ?? true) {
        emit(state.copyWith(states: HomeScreenStates.initialState));
      }
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      List<Products> products =
          await apiService.getMeals(searchText: searchText);
      categories = await apiService.getCategories();
      List<Banners> banners = await apiService.getBanners();
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          products: products,
          categories: categories,
          banners: banners,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
    }
  }
}
