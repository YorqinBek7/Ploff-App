import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/splash_screen/splash_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/widgets/profile_subscreen_appbar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: PloffColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(Plofficons.globus),
                    title: const Text("Language"),
                    tileColor: PloffColors.C_F0F0F0,
                    trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Plofficons.arrow_right),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(Plofficons.notification),
                    title: const Text("Notification"),
                    tileColor: PloffColors.C_F0F0F0,
                    trailing: CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                sharedPreferences!.setString("numberPhone", "");
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: PloffColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Log out",
                    style: PloffTextStyle.w500.copyWith(
                      color: PloffColors.red,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
