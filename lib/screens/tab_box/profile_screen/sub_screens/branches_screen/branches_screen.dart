import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
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
          style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      backgroundColor: PloffColors.C_F0F0F0,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: PloffColors.white,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, Constants.detailBranchesScreeen);
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
