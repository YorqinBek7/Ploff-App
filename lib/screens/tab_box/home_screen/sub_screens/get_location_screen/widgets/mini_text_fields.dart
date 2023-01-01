import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';

class MiniTextaFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MiniTextaFields({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: PloffColors.C_F0F0F0,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 10.0.h),
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
