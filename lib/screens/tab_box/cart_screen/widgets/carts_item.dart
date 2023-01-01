import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_cubit.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartsItem extends StatefulWidget {
  const CartsItem({
    Key? key,
    required this.aboutMeal,
  }) : super(key: key);

  final CategWithProduct aboutMeal;

  @override
  State<CartsItem> createState() => _CartsItemState();
}

class _CartsItemState extends State<CartsItem> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
        color: PloffColors.white,
        border: Border(
          bottom: BorderSide(
            color: PloffColors.black.withOpacity(.1),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Plofficons.meal,
                width: 88.0.w,
                height: 88.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.0.w,
                    child: Text(
                      widget.aboutMeal.title.uz,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: PloffTextStyle.w600.copyWith(fontSize: 17.0.sp),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    width: 150.0.w,
                    child: Text(
                      widget.aboutMeal.description.uz,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: PloffTextStyle.w500.copyWith(fontSize: 15.0.sp),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15.0.w),
                    child: SvgPicture.asset(Plofficons.cancel),
                  ),
                  SizedBox(height: 25.0.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          setState(() => {
                                if (count > 1)
                                  {
                                    count--,
                                    context
                                        .read<CountMealsCubit>()
                                        .removeMeals(),
                                    context.read<BottomNavigationCubit>().sum -=
                                        widget.aboutMeal.outPrice,
                                    log(widget.aboutMeal.outPrice.toString()),
                                  }
                              }),
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            padding: EdgeInsets.all(10.r),
                            height: 32.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.r),
                              color: PloffColors.C_FAFAFA,
                            ),
                            child: SvgPicture.asset(Plofficons.minus)),
                      ),
                      Text("$count"),
                      GestureDetector(
                        onTap: () {
                          context.read<CountMealsCubit>().addMeals();
                          context.read<BottomNavigationCubit>().sum +=
                              widget.aboutMeal.outPrice;
                          setState(() => {count++});
                        },
                        child: Container(
                            height: 32.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            padding: EdgeInsets.all(10.0.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.r),
                              color: PloffColors.C_FAFAFA,
                            ),
                            child: SvgPicture.asset(Plofficons.plus)),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
