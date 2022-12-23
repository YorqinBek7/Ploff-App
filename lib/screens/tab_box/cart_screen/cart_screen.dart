import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_state.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen.dart';
import 'package:ploff/screens/tab_box/cart_screen/widgets/delete_dialog.dart';
import 'package:ploff/screens/tab_box/cart_screen/widgets/carts_item.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final Box<CategWithProduct> savedMeals = HiveService.instance.cartProductsBox;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "Savatcha",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
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
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<BottomNavigationCubit, int>(
              builder: (context, state) {
                return BlocBuilder<CountMealsCubit, CountMealsState>(
                  builder: (context, state) {
                    return CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 15,
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
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 15,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: PloffColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add comment",
                                  style: PloffTextStyle.w600
                                      .copyWith(fontSize: 15),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: PloffColors.C_F0F0F0,
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Add comment to order",
                                      hintStyle: PloffTextStyle.w400.copyWith(
                                        fontSize: 15,
                                        color: PloffColors.C_858585,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 12,
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order price",
                      style: PloffTextStyle.w400.copyWith(fontSize: 18),
                    ),
                    BlocBuilder<BottomNavigationCubit, int>(
                      builder: (context, state) {
                        return BlocBuilder<CountMealsCubit, CountMealsState>(
                          builder: (context, state) {
                            return Text(
                              Helper.formatSumm(context
                                  .read<BottomNavigationCubit>()
                                  .sum
                                  .toString()),
                              style: PloffTextStyle.w400.copyWith(fontSize: 18),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GlobalButton(
                  buttonText: HiveService.instance.cartProductsBox.isEmpty
                      ? "Mahsulot qo'shing"
                      : "Buyurtma qilish",
                  onTap: () {
                    HiveService.instance.cartProductsBox.isNotEmpty
                        ? Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const CheckOutScreen(),
                            ),
                          )
                        : context
                            .read<BottomNavigationCubit>()
                            .changeBottomNavigationPages(0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
