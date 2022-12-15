import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ploff/data/models/banenrs/banner.dart';
import 'package:ploff/data/models/categories/categories.dart';
import 'package:ploff/data/models/products/product.dart';
import 'package:ploff/data/service/api_service/api_service.dart';

part 'get_product_and_category_state.dart';

class GetProductAndCategoryCubit extends Cubit<GetProductAndCategoryState> {
  List<int> selectedCategories = [];
  GetProductAndCategoryCubit()
      : super(const GetProductAndCategoryState(
            errorText: '',
            products: [],
            status: FormzStatus.pure,
            categories: [],
            banners: []));

  ApiService apiService = ApiService();
  Future<void> getProductAndCateg({String? searchText}) async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      List<Product> products =
          await apiService.getMeals(searchText: searchText);
      List<Categorie> categorie = await apiService.getCategories();
      List<Banner> banners = await apiService.getBanners();
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          products: products,
          categories: categorie,
          banners: banners,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
    }
  }
}
