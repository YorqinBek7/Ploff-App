import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';

class EditFields extends StatelessWidget {
  final TextEditingController controller;
  final bool isDisable;

  const EditFields({
    Key? key,
    required this.controller,
    required this.isDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      margin: EdgeInsets.only(bottom: 15.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        color: PloffColors.C_F0F0F0,
      ),
      child: TextField(
        enabled: isDisable,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
