import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ploff/data/models/products/product.dart';
import 'package:ploff/data/service/api_service.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit()
      : super(const GetProductsState(
            errorText: '', products: [], status: FormzStatus.pure));
  ApiService apiService = ApiService();
  Future<List<Product>> getAllProducts() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      List<Product> allProducts = await apiService.getMeals();
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, products: allProducts));
      return allProducts;
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
      throw Exception(e);
    }
  }
}
