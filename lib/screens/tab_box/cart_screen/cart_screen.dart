import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/change_language/change_language_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_state.dart';
import 'package:ploff/cubits/empty_cart/empty_cart_cubit.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/cart_screen/widgets/delete_dialog.dart';
import 'package:ploff/screens/tab_box/cart_screen/widgets/carts_item.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final Box<CategWithProduct> savedMeals = HiveService.instance.cartProductsBox;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: PloffColors.C_F0F0F0,
          appBar: AppBar(
            title: Text(
              tr("cart"),
              style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
            ),
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0.0,
            actions: [
              InkWell(
                onTap: () {
                  deleteAllDialog(context);
                },
                child: SvgPicture.asset(Plofficons.korzina),
              ),
              SizedBox(width: 20.w)
            ],
          ),
          body: BlocBuilder<EmptyCartCubit, EmptyCartState>(
            builder: (context, state) {
              if (state is EmptyCartEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Plofficons.emptyCart),
                      SizedBox(height: 5.h),
                      Text(
                        tr('empty'),
                        style: PloffTextStyle.w500.copyWith(fontSize: 16.0.sp),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: BlocBuilder<BottomNavigationCubit, int>(
                        builder: (context, state) {
                          return BlocBuilder<CountMealsCubit, CountMealsState>(
                            builder: (context, state) {
                              return CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: 15.0.h,
                                    ),
                                  ),
                                  ...List.generate(
                                    savedMeals.length,
                                    (index) => SliverToBoxAdapter(
                                      child: CartsItem(
                                        aboutMeal: savedMeals.getAt(index)!,
                                      ),
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: 15.0.h,
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0.r),
                                      decoration: BoxDecoration(
                                        color: PloffColors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Add comment",
                                            style: PloffTextStyle.w600
                                                .copyWith(fontSize: 15.0.sp),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0.h),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0.r),
                                              color: PloffColors.C_F0F0F0,
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    "Add comment to order",
                                                hintStyle: PloffTextStyle.w400
                                                    .copyWith(
                                                  fontSize: 15.0.sp,
                                                  color: PloffColors.C_858585,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: 12.h,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: PloffColors.white),
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order price",
                                style: PloffTextStyle.w400
                                    .copyWith(fontSize: 18.0.sp),
                              ),
                              BlocBuilder<BottomNavigationCubit, int>(
                                builder: (context, state) {
                                  return BlocBuilder<CountMealsCubit,
                                      CountMealsState>(
                                    builder: (context, state) {
                                      return Text(
                                        Helper.formatSumm(context
                                            .read<BottomNavigationCubit>()
                                            .sum
                                            .toString()),
                                        style: PloffTextStyle.w400
                                            .copyWith(fontSize: 18.0.sp),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GlobalButton(
                            buttonText:
                                HiveService.instance.cartProductsBox.isEmpty
                                    ? "Mahsulot qo'shing"
                                    : "Buyurtma qilish",
                            onTap: () {
                              HiveService.instance.cartProductsBox.isNotEmpty
                                  ? Navigator.pushNamed(
                                      context, Constants.checkoutScreen)
                                  : context
                                      .read<BottomNavigationCubit>()
                                      .changeBottomNavigationPages(0);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
