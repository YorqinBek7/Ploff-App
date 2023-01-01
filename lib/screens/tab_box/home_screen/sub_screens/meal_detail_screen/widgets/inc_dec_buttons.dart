import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IncDecButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;

  const IncDecButtons({
    Key? key,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0.r),
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: SvgPicture.asset(
          imagePath,
          width: 20.0.w,
        ),
      ),
    );
  }
}
