part of 'modifiers_cubit.dart';

class ModifiersState extends Equatable {
  const ModifiersState({
    required this.errorText,
    required this.status,
    required this.variants,
  });
  final String errorText;
  final FormzStatus status;
  final List<VariantsModel> variants;

  ModifiersState copyWith({
    String? errorText,
    FormzStatus? status,
    List<VariantsModel>? variants,
  }) =>
      ModifiersState(
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
        variants: variants ?? this.variants,
      );
  @override
  List<Object> get props => [
        errorText,
        status,
        variants,
      ];
}
