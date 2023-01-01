import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class OrderDetailTexts extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  const OrderDetailTexts({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5.w),
          Text(
            title,
            style: PloffTextStyle.w400.copyWith(
              fontSize: 15.sp,
              color: PloffColors.C_858585,
            ),
          ),
          const Spacer(),
          Text(
            description,
            style: PloffTextStyle.w500.copyWith(
              fontSize: 15.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}
