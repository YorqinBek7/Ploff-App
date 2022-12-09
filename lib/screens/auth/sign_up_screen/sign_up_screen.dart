import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class SignUpScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int index = 0;
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(Plofficons.arrow_back),
          onPressed: () {
            if (index > -1) {
              index--;
            }
            if (index >= 0) {
              _pageController.jumpToPage(index);
            } else {
              Navigator.pop(context);
            }
          },
        ),
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
            const SizedBox(height: 24),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FistPage(
                    phoneController: phoneController,
                    formKey: _formKey,
                  ),
                  const SecondPage(),
                ],
              ),
            ),
            GlobalButton(
              buttonText: "Продолжить",
              onTap: () async {
                if (phoneController.text.isNotEmpty) {
                  await sharedPreferences!
                      .setString("numberPhone", phoneController.text);
                }
                index++;
                if (index < 2 && phoneController.text.isNotEmpty) {
                  _pageController.jumpToPage(index);
                } else if (phoneController.text.isEmpty) {
                } else {
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

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Pinput(
          length: 6,
        ),
      ],
    );
  }
}

class FistPage extends StatelessWidget {
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  const FistPage({
    required this.phoneController,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Номер телефона",
          style: PloffTextStyle.w400.copyWith(fontSize: 15),
        ),
        Form(
          key: formKey,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: phoneController,
            style: PloffTextStyle.w500.copyWith(fontSize: 15),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter something";
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              focusColor: PloffColors.C_FFCC00,
              prefixIcon: Text(
                " +998 ",
                style: PloffTextStyle.w500.copyWith(fontSize: 15),
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 60,
                maxWidth: 60,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
