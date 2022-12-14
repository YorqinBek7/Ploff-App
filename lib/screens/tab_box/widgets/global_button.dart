import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class GlobalButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const GlobalButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PloffColors.C_FFCC00,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0.h),
        child: Center(
          child: Text(
            buttonText,
            style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
          ),
        ),
      ),
    );
  }
}
