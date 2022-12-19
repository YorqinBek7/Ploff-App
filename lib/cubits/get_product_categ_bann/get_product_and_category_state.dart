part of 'get_product_and_category_cubit.dart';

class GetProductAndCategoryState extends Equatable {
  final String errorText;
  final FormzStatus status;
  final List<CategProducts> categories;
  final List<SearchedProducts> searchedProducts;

  final List<Banners> banners;
  final HomeScreenStates states;
  const GetProductAndCategoryState({
    required this.errorText,
    required this.categories,
    required this.status,
    required this.banners,
    required this.states,
    required this.searchedProducts,
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
      categories: products ?? this.categories,
      status: status ?? this.status,
      banners: banners ?? this.banners,
      states: states ?? this.states,
      searchedProducts: searchedProducts ?? this.searchedProducts,
    );
  }

  @override
  List<Object> get props => [categories, errorText, status, states];
}
