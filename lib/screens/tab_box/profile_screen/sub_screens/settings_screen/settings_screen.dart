import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';
import 'dart:io' show Platform;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
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
                    onTap: () {
                      languageBottomDialog(context);
                    },
                    trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(),
                        );
                      },
                      icon: SvgPicture.asset(Plofficons.arrow_right),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(Plofficons.notification),
                    title: const Text("Notification"),
                    tileColor: PloffColors.C_F0F0F0,
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: isNotificationOn,
                            onChanged: (value) {
                              setState(() => {
                                    isNotificationOn = value,
                                  });
                            },
                          )
                        : Switch(
                            value: isNotificationOn,
                            onChanged: (value) {
                              setState(
                                () => {
                                  isNotificationOn = value,
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                SharedPreferencesService.instance.sharedPreferences
                    .setString("numberPhone", "");
                context
                    .read<BottomNavigationCubit>()
                    .changeBottomNavigationPages(0);
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const HomeTab(),
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

  Future<dynamic> languageBottomDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Language",
                style: PloffTextStyle.w600.copyWith(fontSize: 20),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(Plofficons.uzbFlag),
              title: Text(
                "O'zbekcha",
                style: PloffTextStyle.w600.copyWith(fontSize: 15),
              ),
              trailing: const Icon(
                Icons.done,
                color: PloffColors.C_FFCC00,
              ),
            ),
            const Divider(),
            ListTile(
                leading: Image.asset(Plofficons.russiaFlag),
                title: Text(
                  "Русский",
                  style: PloffTextStyle.w600.copyWith(fontSize: 15),
                ),
                trailing: null),
            const Divider(),
            ListTile(
              leading: Image.asset(Plofficons.englishFlag),
              title: Text(
                "English",
                style: PloffTextStyle.w600.copyWith(fontSize: 15),
              ),
              trailing: null,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
