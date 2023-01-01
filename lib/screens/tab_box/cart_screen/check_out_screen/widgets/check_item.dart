import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/style/text_style.dart';

class CheckItem extends StatelessWidget {
  final String item;
  final String price;
  const CheckItem({
    Key? key,
    required this.item,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item,
            style: PloffTextStyle.w500.copyWith(
              color: PloffColors.C_858585,
              fontSize: 15.0.sp,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            Helper.formatSumm(price),
            style: PloffTextStyle.w600.copyWith(
              color: PloffColors.C_858585,
              fontSize: 15.0.sp,
            ),
          ),
        ),
      ],
    );
  }
}
