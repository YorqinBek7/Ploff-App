import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';

class BannerWidget extends StatelessWidget {
  final String imagePath;
  const BannerWidget({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        color: PloffColors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.r),
          color: PloffColors.C_F0F0F0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0.r),
          child: Image.network(
            imagePath,
            width: 148.0.w,
            height: 152.0.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
