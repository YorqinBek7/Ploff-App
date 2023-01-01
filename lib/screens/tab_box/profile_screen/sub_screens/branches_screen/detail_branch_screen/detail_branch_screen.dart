import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/detail_branch_screen/widgets/detail_branch_item.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class DetailBranchScreen extends StatelessWidget {
  const DetailBranchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "Branches",
          style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0.h,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: PloffColors.white,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        Plofficons.ploffLogo,
                        width: 140.0.w,
                        height: 150.0.h,
                      ),
                    ),
                    Text(
                      "TEST",
                      style: PloffTextStyle.w500.copyWith(
                        fontSize: 16.0.sp,
                      ),
                    ),
                    const BranchesInfoItem(
                      info: '12-sagban',
                      icon: Icons.location_on_outlined,
                      title: 'Adress',
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {},
                      child: const BranchesInfoItem(
                        info: 'Tashkent',
                        icon: Icons.location_on_outlined,
                        title: 'Reference point',
                      ),
                    ),
                    const Divider(),
                    const BranchesInfoItem(
                      info: '9:00 - 23:51',
                      icon: Icons.more_time,
                      title: 'Working time',
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => {},
                      child: const BranchesInfoItem(
                        info: '+998 123 23 34',
                        icon: Icons.location_on_outlined,
                        title: 'Phone number',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
