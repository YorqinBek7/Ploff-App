import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ploff/data/models/modifier/variants.dart';
import 'package:ploff/data/service/api_service/api_service.dart';

part 'modifiers_state.dart';

class ModifiersCubit extends Cubit<ModifiersState> {
  ApiService apiService = ApiService();
  ModifiersCubit()
      : super(const ModifiersState(
          errorText: '',
          status: FormzStatus.pure,
          variants: [],
        ));
  void getModifiers() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      List<VariantsModel> variants =
          await apiService.getModifiers('ec0db30d-a935-4ef7-b1d5-6c4649ff18ca');
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, variants: variants));
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
    }
  }
}
