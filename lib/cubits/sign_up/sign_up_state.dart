part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInInitial extends SignUpState {
  SignUpInInitial();
}

class SignUpInEnterPhoneError extends SignUpState {
  String errorText;
  SignUpInEnterPhoneError({required this.errorText});
}

class SignUpInOtpError extends SignUpState {
  String errorText;
  SignUpInOtpError({required this.errorText});
}
