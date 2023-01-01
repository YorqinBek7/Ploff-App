import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';

class CustomBottomAppBar extends StatelessWidget implements PreferredSize {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
        color: PloffColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0.r),
          topRight: Radius.circular(10.0.r),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 10);
}
