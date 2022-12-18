import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/screens/auth/sign_up_screen/otp_page.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EnterPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.white,
      appBar: AppBar(
        backgroundColor: PloffColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Регистрация",
              style: PloffTextStyle.w600.copyWith(fontSize: 26),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Номер телефона",
                  style: PloffTextStyle.w400.copyWith(fontSize: 15),
                ),
                Form(
                  key: _formKey,
                  child: BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpInEnterPhoneError) {
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: phoneController,
                          style: PloffTextStyle.w500.copyWith(fontSize: 15),
                          decoration: InputDecoration(
                            errorText: state.errorText,
                            filled: true,
                            focusColor: PloffColors.C_FFCC00,
                            prefixIcon: Text(
                              " +998 ",
                              style: PloffTextStyle.w500.copyWith(fontSize: 15),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              maxHeight: 60,
                              maxWidth: 60,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      } else {
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: phoneController,
                          style: PloffTextStyle.w500.copyWith(fontSize: 15),
                          decoration: InputDecoration(
                            errorText: null,
                            filled: true,
                            focusColor: PloffColors.C_FFCC00,
                            prefixIcon: Text(
                              " +998 ",
                              style: PloffTextStyle.w500.copyWith(fontSize: 15),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              maxHeight: 60,
                              maxWidth: 60,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GlobalButton(
              buttonText: "Продолжить",
              onTap: () async {
                if (phoneController.text.isEmpty) {
                  context.read<SignUpCubit>().errorCheckInPhoneNum(
                      errorText: "Please enter something!");
                } else if (phoneController.text.length < 9 ||
                    phoneController.text.length < 9) {
                  context.read<SignUpCubit>().errorCheckInPhoneNum(
                      errorText: "Please enter correct number!");
                } else {
                  context.read<SignUpCubit>().numberPhone =
                      phoneController.text;
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => OtpPage(),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
