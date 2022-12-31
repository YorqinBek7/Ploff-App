part of 'change_language_cubit.dart';

enum Languages {
  uzbek,
  english,
  russian,
}

class ChangeLanguageState extends Equatable {
  final Languages languages;
  const ChangeLanguageState({
    required this.languages,
  });
  ChangeLanguageState copyWith({
    Languages? languages,
  }) =>
      ChangeLanguageState(
        languages: languages ?? this.languages,
      );

  @override
  List<Object> get props => [
        languages,
      ];
}
