import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_cubit.dart';
import 'package:ploff/cubits/empty_cart/empty_cart_cubit.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

Future<dynamic> deleteAllDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Очистить корзину?",
            style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "Вы уверены, что хотите очистить корзину?",
            style: PloffTextStyle.w400.copyWith(
              fontSize: 15.0.sp,
              color: PloffColors.C_858585,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: const DialogButtons(
                    color: PloffColors.C_F0F0F0,
                    text: 'Нет',
                  ),
                ),
              ),
              SizedBox(
                width: 5.0.w,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    context.read<BottomNavigationCubit>().sum = 0;
                    await HiveService.instance.cartProductsBox.clear();
                    context.read<CountMealsCubit>().deleteAllMeals();
                    context.read<EmptyCartCubit>().empty();
                    Navigator.pop(context);
                  },
                  child: const DialogButtons(
                    color: PloffColors.C_FFCC00,
                    text: 'Да',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class DialogButtons extends StatelessWidget {
  final String text;
  final Color color;
  const DialogButtons({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: PloffTextStyle.w600.copyWith(fontSize: 15.sp),
        ),
      ),
    );
  }
}
