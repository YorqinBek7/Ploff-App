part of 'get_product_and_category_cubit.dart';

class GetProductAndCategoryState extends Equatable {
  final String errorText;
  final FormzStatus status;
  final List<Product> products;
  final List<Categorie> categories;
  final List<Banner> banners;
  final HomeScreenStates states;
  const GetProductAndCategoryState({
    required this.errorText,
    required this.products,
    required this.status,
    required this.categories,
    required this.banners,
    required this.states,
  });

  GetProductAndCategoryState copyWith({
    String? errorText,
    FormzStatus? status,
    List<Product>? products,
    List<Categorie>? categories,
    List<Banner>? banners,
    HomeScreenStates? states,
  }) {
    return GetProductAndCategoryState(
        errorText: errorText ?? this.errorText,
        products: products ?? this.products,
        status: status ?? this.status,
        categories: categories ?? this.categories,
        banners: banners ?? this.banners,
        states: states ?? this.states);
  }

  @override
  List<Object> get props => [categories, products, errorText, status, states];
}
