import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CondensationPolicyScreen extends StatelessWidget {
  const CondensationPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Condensation policy"),
      ),
      backgroundColor: PloffColors.C_F0F0F0,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0.r),
              margin: EdgeInsets.symmetric(horizontal: 10.0.w),
              decoration: BoxDecoration(
                color: PloffColors.white,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Column(
                children: [
                  Text(
                    "We make customers happy",
                    style: PloffTextStyle.w500.copyWith(fontSize: 18.0.sp),
                  ),
                  Text(
                    "We make customers happy We make customers happy We make customers happy We make customers happy We make customers happy We make customers happy ",
                    style: PloffTextStyle.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
