import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/about_screen/about_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/branches_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/settings_screen/settings_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/widgets/profile_options_item.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
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
                      sharedPreferences!.getString("numberPhone").toString(),
                      style: PloffTextStyle.w400.copyWith(
                        color: PloffColors.black.withOpacity(.5),
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(Plofficons.edit),
                )
              ],
            ),
          ),
          ProfileOptionsItem(
            icon: Plofficons.my_location,
            title: 'My locations',
            onTap: () {},
          ),
          ProfileOptionsItem(
            icon: Plofficons.location_black,
            title: "Branches",
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return const BranchesScreen();
                  },
                ),
              );
            },
          ),
          ProfileOptionsItem(
            icon: Plofficons.settings,
            title: "Settings",
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return const SettingsScreen();
                  },
                ),
              );
            },
          ),
          ProfileOptionsItem(
            icon: Plofficons.about,
            title: "About the service",
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
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
  }
}
