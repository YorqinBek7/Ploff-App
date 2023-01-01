import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/style/text_style.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorText = "";
  EnterPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.white,
      appBar: AppBar(
        backgroundColor: PloffColors.white,
        elevation: 0,
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpInEnterPhoneError) {
            errorText = state.errorText;
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Регистрация",
                style: PloffTextStyle.w600.copyWith(fontSize: 26.0.sp),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Номер телефона",
                    style: PloffTextStyle.w400.copyWith(fontSize: 15.0.sp),
                  ),
                  Form(
                    key: _formKey,
                    child: BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                      return TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: PloffTextStyle.w500.copyWith(fontSize: 15),
                        inputFormatters: [
                          MaskedInputFormatter(
                            "## ###-##-##",
                          )
                        ],
                        decoration: InputDecoration(
                          errorText: errorText.isNotEmpty ? errorText : null,
                          filled: true,
                          focusColor: PloffColors.C_FFCC00,
                          prefixIcon: Text(
                            " +998 ",
                            style:
                                PloffTextStyle.w500.copyWith(fontSize: 15.0.sp),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 60.0.h,
                            maxWidth: 60.0.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 10.0.h),
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
                    Navigator.pushReplacementNamed(
                        context, Constants.otpScreen);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
