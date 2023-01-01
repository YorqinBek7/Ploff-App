import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class ActiveOrderItem extends StatelessWidget {
  const ActiveOrderItem({
    Key? key,
    required this.isVisible,
    required this.onTap,
  }) : super(key: key);

  final bool isVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.0.h),
        padding: EdgeInsets.all(16.0.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: PloffColors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No:123321",
                  style: PloffTextStyle.w600.copyWith(
                    fontSize: 17.0.sp,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                    shadowColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Order is processed"),
                ),
              ],
            ),
            SizedBox(height: 20.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PloffColors.C_FFCC00,
                  ),
                  child: SvgPicture.asset(Plofficons.done),
                ),
                Expanded(
                  child: Container(
                    height: 2.0.h,
                    color: !isVisible
                        ? PloffColors.C_FFCC00
                        : PloffColors.C_F0F0F0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PloffColors.C_FFCC00,
                  ),
                  child: SvgPicture.asset(Plofficons.chef),
                ),
                Expanded(
                  child: Container(
                    height: 2.0.h,
                    color: !isVisible
                        ? PloffColors.C_FFCC00
                        : PloffColors.C_F0F0F0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PloffColors.C_FAFAFA,
                  ),
                  child: SvgPicture.asset(Plofficons.car),
                ),
                Expanded(
                  child: Container(
                    height: 2.0.h,
                    color:
                        isVisible ? PloffColors.C_FFCC00 : PloffColors.C_F0F0F0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PloffColors.C_FAFAFA,
                  ),
                  child: SvgPicture.asset(Plofficons.flag),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
