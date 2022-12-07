import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/about_screen/sub_screens/condensation_policy_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/about_screen/sub_screens/license_agreements.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/widgets/profile_subscreen_appbar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileSubscreensAppbar(title: "About the service"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Condensation policy"),
                    trailing: SvgPicture.asset(Plofficons.arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CondensationPolicyScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("License agreements"),
                    trailing: SvgPicture.asset(Plofficons.arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LicenceScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
