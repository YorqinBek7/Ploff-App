import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/screens/auth/sign_up_screen/widgets/first_page.dart';
import 'package:ploff/screens/auth/sign_up_screen/widgets/next_page_extansion.dart';
import 'package:ploff/screens/auth/sign_up_screen/widgets/previous_page.dart';
import 'package:ploff/screens/auth/sign_up_screen/widgets/second_page.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
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
            toPreviousPage(context, index, _pageController);
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
                await toNextPage(
                    context, phoneController, index, _pageController);
              },
            )
          ],
        ),
      ),
    );
  }
}
