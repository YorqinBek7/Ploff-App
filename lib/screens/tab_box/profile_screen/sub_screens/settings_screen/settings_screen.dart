import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/change_language/change_language_cubit.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
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
          tr("settings"),
          style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: PloffColors.white,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(Plofficons.globus),
                    title: Text(tr("language")),
                    tileColor: PloffColors.C_F0F0F0,
                    onTap: () {
                      languageBottomDialog(context);
                    },
                    trailing: IconButton(
                      onPressed: () {
                        languageBottomDialog(context);
                      },
                      icon: SvgPicture.asset(Plofficons.arrow_right),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(Plofficons.notification),
                    title: Text(tr("notification")),
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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Constants.homeTab,
                  (route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                decoration: BoxDecoration(
                  color: PloffColors.white,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Center(
                  child: Text(
                    tr("log_out"),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0.r),
          topRight: Radius.circular(10.0.r),
        ),
      ),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.0.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.0.h),
            child: Text(
              tr("language"),
              style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
            ),
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(Plofficons.uzbFlag),
            title: Text(
              "O'zbekcha",
              style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
            ),
            trailing: context.locale.languageCode == "uz"
                ? const Icon(
                    Icons.done,
                    color: PloffColors.C_FFCC00,
                  )
                : null,
            onTap: () async {
              if (context.locale.languageCode != "uz") {
                context
                    .read<ChangeLanguageCubit>()
                    .changeLanguage(languageCode: context.locale.languageCode);
                await context.setLocale(const Locale("uz", "UZ"));
                await SharedPreferencesService.instance.sharedPreferences
                    .setString("lan", "uz");
              }
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(Plofficons.russiaFlag),
            title: Text(
              "Русский",
              style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
            ),
            trailing: context.locale.languageCode == "ru"
                ? const Icon(
                    Icons.done,
                    color: PloffColors.C_FFCC00,
                  )
                : null,
            onTap: () async {
              if (context.locale.languageCode != "ru") {
                context
                    .read<ChangeLanguageCubit>()
                    .changeLanguage(languageCode: context.locale.languageCode);
                await context.setLocale(const Locale("ru", "RU"));
                await SharedPreferencesService.instance.sharedPreferences
                    .setString("lan", "ru");
              }
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(Plofficons.englishFlag),
            title: Text(
              "English",
              style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
            ),
            trailing: context.locale.languageCode == "en"
                ? const Icon(
                    Icons.done,
                    color: PloffColors.C_FFCC00,
                  )
                : null,
            onTap: () async {
              context
                  .read<ChangeLanguageCubit>()
                  .changeLanguage(languageCode: context.locale.languageCode);
              if (context.locale.languageCode != "en") {
                await context.setLocale(const Locale("en", "EN"));
                await SharedPreferencesService.instance.sharedPreferences
                    .setString("lan", "en");
              }
              Navigator.pop(context);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
