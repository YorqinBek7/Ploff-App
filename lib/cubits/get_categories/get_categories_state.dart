part of 'get_categories_cubit.dart';

class GetCategoriesState extends Equatable {
  final String errorText;
  final FormzStatus status;
  final List<Categorie> categories;
  const GetCategoriesState({
    required this.errorText,
    required this.categories,
    required this.status,
  });

  GetCategoriesState copyWith(
      {String? errorText, FormzStatus? status, List<Categorie>? categories}) {
    return GetCategoriesState(
      errorText: errorText ?? this.errorText,
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [errorText, status, categories];
}
