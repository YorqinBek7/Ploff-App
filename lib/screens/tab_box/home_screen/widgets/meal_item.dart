import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MealItem extends StatelessWidget {
  final CategWithProduct product;
  final int index;
  final int length;
  final VoidCallback onTap;
  const MealItem({
    Key? key,
    required this.product,
    required this.index,
    required this.length,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0.r),
        onTap: onTap,
        child: Ink(
          color: PloffColors.white,
          child: Container(
            decoration: BoxDecoration(
              border: index != length - 1
                  ? Border(
                      bottom: BorderSide(
                        color: PloffColors.black.withOpacity(.1),
                      ),
                    )
                  : null,
            ),
            child: Row(
              children: [
                SizedBox(width: 16.0.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        product.title.uz,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: PloffTextStyle.w500.copyWith(fontSize: 15.0.sp),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        product.description.uz,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: PloffTextStyle.w400.copyWith(
                          color: PloffColors.black.withOpacity(.4),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    Text(
                      Helper.formatSumm(product.outPrice.toString()),
                      style: PloffTextStyle.w600.copyWith(fontSize: 16.0.sp),
                    )
                  ],
                ),
                const Spacer(),
                Image.asset(
                  Plofficons.meal,
                  width: 130.0.w,
                  height: 130.0.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
