import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit()
      : super(
          const ChangeLanguageState(
            languages: Languages.uzbek,
          ),
        );
  void changeLanguage({required String languageCode}) {
    switch (languageCode) {
      case 'uz':
        emit(state.copyWith(languages: Languages.uzbek));
        break;
      case 'ru':
        emit(state.copyWith(languages: Languages.russian));
        break;
      case 'en':
        emit(state.copyWith(languages: Languages.english));
        break;
    }
  }
}
