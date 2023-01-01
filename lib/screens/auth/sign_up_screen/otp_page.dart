import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Регистрация",
                style: PloffTextStyle.w600.copyWith(fontSize: 26.0.sp)),
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
            SizedBox(height: 15.h),
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
                  SharedPreferencesService.instance.sharedPreferences.setString(
                      "numberPhone", context.read<SignUpCubit>().numberPhone);
                  Navigator.pushReplacementNamed(context, Constants.homeTab);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
