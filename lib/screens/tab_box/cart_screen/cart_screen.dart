import 'package:flutter/material.dart';
import 'package:ploff/screens/auth/sign_up_screen/widgets/auth_button.dart';
import 'package:ploff/screens/tab_box/widgets/custom_app_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: const CustomAppBar(
        title: 'Savatcha',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Column(
              children: [
                Image.asset(Plofficons.ploffLogo),
                const Text("Savatda hali mahsulot yo'q"),
              ],
            ),
            const Spacer(),
            AuthButton(
              buttonText: "Mahsulot qo'shing",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
