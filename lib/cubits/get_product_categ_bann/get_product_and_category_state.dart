part of 'get_product_and_category_cubit.dart';

class GetProductAndCategoryState extends Equatable {
  final String errorText;
  final FormzStatus status;
  final List<SearchedProducts> searchedProducts;
  final List<CategProducts> products;
  final List<Banners> banners;
  final HomeScreenStates states;
  const GetProductAndCategoryState({
    required this.errorText,
    required this.status,
    required this.banners,
    required this.states,
    required this.searchedProducts,
    required this.products,
  });

  GetProductAndCategoryState copyWith({
    String? errorText,
    FormzStatus? status,
    List<CategProducts>? products,
    List<Banners>? banners,
    HomeScreenStates? states,
    List<SearchedProducts>? searchedProducts,
  }) {
    return GetProductAndCategoryState(
      errorText: errorText ?? this.errorText,
      status: status ?? this.status,
      banners: banners ?? this.banners,
      states: states ?? this.states,
      searchedProducts: searchedProducts ?? this.searchedProducts,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [errorText, status, states];
}
