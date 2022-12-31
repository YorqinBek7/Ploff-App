import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/change_language/change_language_cubit.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/tab_box/profile_screen/widgets/profile_options_item.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: PloffColors.C_F0F0F0,
          appBar: AppBar(
            title: Text(tr("profil"),
                style: PloffTextStyle.w600.copyWith(fontSize: 20)),
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PloffColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yorqin",
                          style: PloffTextStyle.w500.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          SharedPreferencesService.instance.sharedPreferences
                              .getString("numberPhone")
                              .toString(),
                          style: PloffTextStyle.w400.copyWith(
                            color: PloffColors.black.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Constants.editProfileScreen);
                      },
                      icon: SvgPicture.asset(Plofficons.edit),
                    )
                  ],
                ),
              ),
              ProfileOptionsItem(
                icon: Plofficons.my_location,
                title: tr("my_locations"),
                onTap: () {
                  Navigator.pushNamed(context, Constants.myAddressesScreen);
                },
                isDivider: true,
              ),
              ProfileOptionsItem(
                icon: Plofficons.location_black,
                title: tr("branches"),
                onTap: () {
                  Navigator.pushNamed(context, Constants.branchesScreeen);
                },
                isDivider: true,
              ),
              ProfileOptionsItem(
                icon: Plofficons.settings,
                title: tr("settings"),
                onTap: () {
                  Navigator.pushNamed(context, Constants.settingsScreen);
                },
                isDivider: true,
              ),
              ProfileOptionsItem(
                icon: Plofficons.about,
                title: tr("about_the_service"),
                onTap: () {
                  Navigator.pushNamed(context, Constants.aboutScreen);
                },
                isDivider: false,
              ),
              const Spacer(),
              Text(
                "Version 1.0.0",
                style: PloffTextStyle.w500.copyWith(
                  color: PloffColors.black.withOpacity(.5),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }
}
