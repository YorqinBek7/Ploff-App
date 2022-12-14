part of 'get_products_cubit.dart';

class GetProductsState extends Equatable {
  final String errorText;
  final FormzStatus status;
  final List<Product> products;
  const GetProductsState({
    required this.errorText,
    required this.products,
    required this.status,
  });

  GetProductsState copyWith({
    String? errorText,
    FormzStatus? status,
    List<Product>? products,
  }) {
    return GetProductsState(
      errorText: errorText ?? this.errorText,
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [errorText, status, products];
}
