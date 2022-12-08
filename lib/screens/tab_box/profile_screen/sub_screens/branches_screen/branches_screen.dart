import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/detail_branch_screen/detail_branch_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Branches",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
      ),
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
                    CupertinoPageRoute(
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
