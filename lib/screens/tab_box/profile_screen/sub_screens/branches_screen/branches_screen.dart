import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/detail_branch_screen/detail_branch_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/widgets/profile_subscreen_appbar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileSubscreensAppbar(title: "Branches"),
      backgroundColor: PloffColors.C_F0F0F0,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailBranchScreen(),
                    ),
                  );
                },
                tileColor: PloffColors.C_F0F0F0,
                leading: Image.asset(
                  Plofficons.ploffLogo,
                ),
                title: const Text("TEST"),
                subtitle: const Text("Tashkent"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Plofficons.arrow_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
