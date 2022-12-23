import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInInitial());
  String numberPhone = "";
  void errorCheckInPhoneNum({required String errorText}) {
    emit(SignUpInEnterPhoneError(errorText: errorText));
  }

  void errorCheckInOtp({required String errorText}) {
    emit(SignUpInOtpError(errorText: errorText));
  }
}
