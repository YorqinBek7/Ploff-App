import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/profile_screen/widgets/profile_options_item.dart';
import 'package:ploff/screens/tab_box/widgets/custom_app_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: const CustomAppBar(title: "Profile"),
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
                      "+998 123 12 34",
                      style: PloffTextStyle.w400.copyWith(
                        color: PloffColors.black.withOpacity(.5),
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: PloffColors.black.withOpacity(.5),
                  ),
                )
              ],
            ),
          ),
          ProfileOptionsItem(
            icon: Icons.location_on_outlined,
            title: 'My locations',
            onTap: () {},
          ),
          ProfileOptionsItem(
            icon: Icons.location_pin,
            title: "Branches",
            onTap: () {},
          ),
          ProfileOptionsItem(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),
          ProfileOptionsItem(
            icon: Icons.warning,
            title: "About the service",
            onTap: () {},
          ),
          const Spacer(),
          Text(
            "Version 1.0.0",
            style: PloffTextStyle.w500.copyWith(
              color: PloffColors.black.withOpacity(.5),
            ),
          )
        ],
      ),
    );
  }
}
