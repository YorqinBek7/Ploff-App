import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CustomTabBar extends StatelessWidget implements PreferredSize {
  final String firstTabText;
  final String secondTabText;

  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.firstTabText,
    required this.secondTabText,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0.r),
      margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: PloffColors.C_F0F0F0,
      ),
      child: TabBar(
        controller: tabController,
        labelColor: PloffColors.black,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: PloffColors.white,
        ),
        onTap: (value) {},
        tabs: [
          Tab(
            height: 40.0.h,
            child: Text(
              firstTabText,
              style: PloffTextStyle.w500.copyWith(fontSize: 15.sp),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          Tab(
            height: 40.0.h,
            child: Text(
              secondTabText,
              style: PloffTextStyle.w500.copyWith(fontSize: 15.sp),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
