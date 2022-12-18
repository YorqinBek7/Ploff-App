import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class OtpPage extends StatelessWidget {
  final TextEditingController pinController = TextEditingController();

  OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PloffColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Регистрация",
                style: PloffTextStyle.w600.copyWith(fontSize: 26)),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                if (state is SignUpInOtpError) {
                  return Pinput(
                    controller: pinController,
                    forceErrorState: true,
                    errorText: state.errorText,
                    length: 6,
                  );
                } else {
                  return Pinput(
                    controller: pinController,
                    length: 6,
                  );
                }
              },
            ),
            const SizedBox(height: 5),
            GlobalButton(
              buttonText: "Продолжить",
              onTap: () async {
                if (pinController.text.isEmpty) {
                  context
                      .read<SignUpCubit>()
                      .errorCheckInOtp(errorText: "Please enter something!");
                } else if (pinController.text.length < 6 ||
                    pinController.text.length < 6) {
                  context
                      .read<SignUpCubit>()
                      .errorCheckInOtp(errorText: "Please enter correct code!");
                } else {
                  sharedPreferences!.setString(
                      "numberPhone", context.read<SignUpCubit>().numberPhone);
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const HomeTab(),
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
