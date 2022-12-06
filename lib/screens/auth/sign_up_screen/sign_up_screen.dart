import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class SignUpScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final TextEditingController phoneController = TextEditingController();
  int index = 0;
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: PloffColors.black,
          ),
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
                if (index < 2) {
                  _pageController.jumpToPage(index);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
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
  const FistPage({
    required this.phoneController,
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
        TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            filled: true,
            focusColor: PloffColors.C_FFCC00,
            hintText: "+998",
            hintStyle: PloffTextStyle.w400.copyWith(fontSize: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
