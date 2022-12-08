import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/widgets/profile_subscreen_appbar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CondensationPolicyScreen extends StatelessWidget {
  const CondensationPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Condensation policy"),
      ),
      backgroundColor: PloffColors.C_F0F0F0,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: PloffColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "We make customers happy",
                    style: PloffTextStyle.w500.copyWith(fontSize: 18),
                  ),
                  const Text(
                    "We make customers happy We make customers happy We make customers happy We make customers happy We make customers happy We make customers happy ",
                    style: PloffTextStyle.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
