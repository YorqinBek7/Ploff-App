import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ploff/data/models/banners/banners.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/category_with_products/categ_with_product.dart';
import 'package:ploff/data/models/searched_products/searched_products.dart';
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
            status: FormzStatus.pure,
            banners: [],
            states: HomeScreenStates.initialState,
            searchedProducts: [],
            products: [],
          ),
        );

  ApiService apiService = ApiService();
  List<CategProducts> products = [];
  List<CategProducts> products2 = [];
  Future<void> getProductAndCateg({String? searchText}) async {
    try {
      List<SearchedProducts> searchedProducts = [];
      if (searchText != null) {
        emit(state.copyWith(states: HomeScreenStates.searchState));
        searchedProducts =
            await apiService.getSearchedProduct(searchText: searchText);
      }
      if (searchText?.isEmpty ?? true) {
        emit(state.copyWith(states: HomeScreenStates.initialState));
      }
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      products = await apiService.getMeals();
      List<Banners> banners = await apiService.getBanners();

      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          products: products,
          banners: banners,
          searchedProducts: searchedProducts,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
    }
  }

  void getProduct({required String id}) {
    for (var element in products) {
      if (element.id == id) {
        if (!products2.remove(element)) {
          products2.add(element);
        }
        Set<CategProducts> set = products2.toSet();
        products2 = set.toList();
      }
    }
  }
}
