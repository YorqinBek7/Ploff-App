import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/cubits/change_language/change_language_cubit.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/select_language_screen/widgets/select_language_item.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Plofficons.ploffLogo,
              width: 148.0.w,
              height: 132.0.h,
            ),
            SizedBox(
              height: 46.h,
            ),
            Text(
              tr("select_language"),
              style: PloffTextStyle.w600.copyWith(fontSize: 17.0.sp),
            ),
            SelectLanguageItem(
              flagImage: Plofficons.uzbFlag,
              languageText: "O'zbekcha",
              onTap: () async {
                Navigator.pushReplacementNamed(context, Constants.homeTab);
                await SharedPreferencesService.instance.sharedPreferences
                    .setString("lan", 'uz');
                await context.setLocale(const Locale("uz", "UZ"));
                context
                    .read<ChangeLanguageCubit>()
                    .changeLanguage(languageCode: context.locale.languageCode);
              },
            ),
            SelectLanguageItem(
              flagImage: Plofficons.russiaFlag,
              languageText: "Русский",
              onTap: () async {
                Navigator.pushReplacementNamed(context, Constants.homeTab);
                await SharedPreferencesService.instance.sharedPreferences
                    .setString("lan", 'ru');
                await context.setLocale(const Locale("ru", "RU"));
                context
                    .read<ChangeLanguageCubit>()
                    .changeLanguage(languageCode: context.locale.languageCode);
              },
            ),
            SelectLanguageItem(
              flagImage: Plofficons.englishFlag,
              languageText: "English",
              onTap: () async {
                Navigator.pushReplacementNamed(context, Constants.homeTab);
                await SharedPreferencesService.instance.sharedPreferences
                    .setString("lan", 'en');
                await context.setLocale(const Locale("en", "EN"));
                context
                    .read<ChangeLanguageCubit>()
                    .changeLanguage(languageCode: context.locale.languageCode);
              },
            )
          ],
        ),
      ),
    );
  }
}
